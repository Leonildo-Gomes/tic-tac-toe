import 'dart:math';

import 'package:tic_tac_toe/core/constants/constant.dart';
import 'package:tic_tac_toe/core/constants/difficulty.dart';
import 'package:tic_tac_toe/models/history.dart';
import 'package:tic_tac_toe/services/database_service.dart';

class GameController {
  List<String> board = List.filled(Constant.boardSize, '');
  List<int> matchedIndexes = [];
  bool gameOver = false;
  bool isUserTurn = true;
  String? winner;
  final Random _random = Random();
  final DatabaseService databaseService;
  final Difficulty difficulty;
  final String userMark;

  static const winningCombinations = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6],
  ];

  GameController(this.databaseService, this.difficulty, this.userMark);

  bool get isDraw => !board.contains('') && winner == null;
  String get botMark => userMark == 'X' ? 'O' : 'X';

  void resetGame() {
    board = List.filled(Constant.boardSize, '');
    gameOver = false;
    matchedIndexes = [];
    winner = null;
    isUserTurn = true;
  }

  void makeMove(int index) {
    if (gameOver || board[index].isNotEmpty || !isUserTurn) {
      return;
    }

    board[index] = userMark;
    isUserTurn = false;
    _updateGameState();

    if (!gameOver) {
      computerMove();
    }
  }

  void _updateGameState() {
    for (final combination in winningCombinations) {
      final first = board[combination[0]];
      if (first.isNotEmpty &&
          first == board[combination[1]] &&
          first == board[combination[2]]) {
        gameOver = true;
        winner = first;
        matchedIndexes.addAll(combination);
        savetHistory(first, userMark);
        return;
      }
    }
    if (isDraw) {
      gameOver = true;
      winner = 'empate';
      savetHistory('Empate', userMark);
    }
  }

  void computerMove() {
    switch (difficulty) {
      case Difficulty.easy:
        _easyMove();
        break;
      case Difficulty.medium:
        _mediumMove();
        break;
      case Difficulty.hard:
        _hardMove();
        break;
    }
    if (!gameOver) {
      isUserTurn = true;
    }
  }

  void _easyMove() {
    final availableMoves = <int>[];
    for (int i = 0; i < board.length; i++) {
      if (board[i].isEmpty) {
        availableMoves.add(i);
      }
    }

    if (availableMoves.isNotEmpty) {
      final move = availableMoves[_random.nextInt(availableMoves.length)];
      board[move] = botMark;
      _updateGameState();
    }
  }

  void _mediumMove() {
    // 1. Tenta ganhar
    int? winningMove = _findWinningOrBlockingMove(botMark);
    if (winningMove != null) {
      board[winningMove] = botMark;
      _updateGameState();
      return;
    }

    // 2. Tenta bloquear o jogador
    int? blockingMove = _findWinningOrBlockingMove(userMark);
    if (blockingMove != null) {
      board[blockingMove] = botMark;
      _updateGameState();
      return;
    }

    // 3. Se não, joga aleatoriamente
    _easyMove();
  }

  int? _findWinningOrBlockingMove(String mark) {
    for (final combination in winningCombinations) {
      final marks = combination.map((index) => board[index]).toList();
      if (marks.where((m) => m == mark).length == 2 && marks.contains('')) {
        final emptyIndex = combination.firstWhere(
          (index) => board[index] == '',
        );
        return emptyIndex;
      }
    }
    return null;
  }

  void _hardMove() {
    int bestMove = -1;
    int bestScore = -1000;

    for (int i = 0; i < board.length; i++) {
      if (board[i].isEmpty) {
        board[i] = botMark;
        int score = _minimax(board, 0, false, userMark, botMark);
        board[i] = '';
        if (score > bestScore) {
          bestScore = score;
          bestMove = i;
        }
      }
    }

    if (bestMove != -1) {
      board[bestMove] = botMark;
      _updateGameState();
    }
  }

  int _minimax(
    List<String> currentBoard,
    int depth,
    bool isMaximizing,
    String userMark,
    String botMark,
  ) {
    String? winner = _checkWinner(currentBoard);
    if (winner != null) {
      return winner == botMark ? 10 - depth : depth - 10;
    }

    if (!currentBoard.contains('')) {
      return 0; // Empate
    }

    if (isMaximizing) {
      int bestScore = -1000;
      for (int i = 0; i < currentBoard.length; i++) {
        if (currentBoard[i].isEmpty) {
          currentBoard[i] = botMark;
          int score = _minimax(
            currentBoard,
            depth + 1,
            false,
            userMark,
            botMark,
          );
          currentBoard[i] = '';
          bestScore = max(score, bestScore);
        }
      }
      return bestScore;
    } else {
      int bestScore = 1000;
      for (int i = 0; i < currentBoard.length; i++) {
        if (currentBoard[i].isEmpty) {
          currentBoard[i] = userMark;
          int score = _minimax(
            currentBoard,
            depth + 1,
            true,
            userMark,
            botMark,
          );
          currentBoard[i] = '';
          bestScore = min(score, bestScore);
        }
      }
      return bestScore;
    }
  }

  String? _checkWinner(List<String> board) {
    for (final combination in winningCombinations) {
      final first = board[combination[0]];
      if (first.isNotEmpty &&
          first == board[combination[1]] &&
          first == board[combination[2]]) {
        return first;
      }
    }
    return null;
  }

  String getGameResult(String userMark) {
    if (isDraw) {
      return '';
    }
    if (winner == userMark) {
      return 'Você';
    } else {
      return 'CPU';
    }
  }

  Future<void> savetHistory(String winner, String userMark) async {
    String mode = getGameResult(userMark);
    final history = History(
      winner: winner,
      mode: mode,
      boardState: board.join(','),
      date: DateTime.now().toIso8601String(),
    );
    await databaseService.insertHistory(history);
  }
}
