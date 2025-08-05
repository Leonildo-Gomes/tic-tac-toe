import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tic_tac_toe/core/constants/constant.dart';
import 'package:tic_tac_toe/core/constants/difficulty.dart';
import 'package:tic_tac_toe/models/game_state.dart';
import 'package:tic_tac_toe/models/history.dart';
import 'package:tic_tac_toe/providers/database/database_provider.dart';

class GameController extends Notifier<GameState> {
  final Random _random = Random();

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

  @override
  GameState build() {
    return GameState(
      board: List.filled(Constant.boardSize, ''),
      matchedIndexes: [],
      gameOver: false,
      isUserTurn: true,
      winner: null,
      difficulty: Difficulty.easy,
      userMark: 'X',
    );
  }

  void initGame(Difficulty difficulty, String userMark) {
    state = GameState(
      board: List.filled(Constant.boardSize, ''),
      matchedIndexes: [],
      gameOver: false,
      isUserTurn: true,
      winner: null,
      difficulty: difficulty,
      userMark: userMark,
    );
  }

  bool get isDraw => !state.board.contains('') && state.winner == null;
  String get botMark => state.userMark == 'X' ? 'O' : 'X';

  void resetGame() {
    state = state.copyWith(
      board: List.filled(Constant.boardSize, ''),
      gameOver: false,
      matchedIndexes: [],
      winner: null,
      isUserTurn: true,
    );
  }

  void makeMove(int index) {
    if (state.gameOver || state.board[index].isNotEmpty || !state.isUserTurn) {
      return;
    }

    final newBoard = List.of(state.board);
    newBoard[index] = state.userMark;

    state = state.copyWith(board: newBoard, isUserTurn: false);
    _updateGameState();

    if (!state.gameOver) {
      computerMove();
    }
  }

  void _updateGameState() {
    for (final combination in winningCombinations) {
      final first = state.board[combination[0]];
      if (first.isNotEmpty &&
          first == state.board[combination[1]] &&
          first == state.board[combination[2]]) {
        state = state.copyWith(
          gameOver: true,
          winner: first,
          matchedIndexes: combination,
        );
        saveHistory(first, state.userMark);
        return;
      }
    }
    if (isDraw) {
      state = state.copyWith(gameOver: true, winner: 'empate');
    }
  }

  void computerMove() {
    switch (state.difficulty) {
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
    if (!state.gameOver) {
      state = state.copyWith(isUserTurn: true);
    }
  }

  void _easyMove() {
    final availableMoves = <int>[];
    for (int i = 0; i < state.board.length; i++) {
      if (state.board[i].isEmpty) {
        availableMoves.add(i);
      }
    }

    if (availableMoves.isNotEmpty) {
      final move = availableMoves[_random.nextInt(availableMoves.length)];
      final newBoard = List.of(state.board);
      newBoard[move] = botMark;
      state = state.copyWith(board: newBoard);
      _updateGameState();
    }
  }

  void _mediumMove() {
    int? winningMove = _findWinningOrBlockingMove(botMark);
    if (winningMove != null) {
      final newBoard = List.of(state.board);
      newBoard[winningMove] = botMark;
      state = state.copyWith(board: newBoard);
      _updateGameState();
      return;
    }

    int? blockingMove = _findWinningOrBlockingMove(state.userMark);
    if (blockingMove != null) {
      final newBoard = List.of(state.board);
      newBoard[blockingMove] = botMark;
      state = state.copyWith(board: newBoard);
      _updateGameState();
      return;
    }

    _easyMove();
  }

  int? _findWinningOrBlockingMove(String mark) {
    for (final combination in winningCombinations) {
      final marks = combination.map((index) => state.board[index]).toList();
      if (marks.where((m) => m == mark).length == 2 && marks.contains('')) {
        final emptyIndex = combination.firstWhere(
          (index) => state.board[index] == '',
        );
        return emptyIndex;
      }
    }
    return null;
  }

  void _hardMove() {
    int bestMove = -1;
    int bestScore = -1000;

    final currentBoard = List.of(state.board);

    for (int i = 0; i < currentBoard.length; i++) {
      if (currentBoard[i].isEmpty) {
        currentBoard[i] = botMark;
        int score = _minimax(currentBoard, 0, false, state.userMark, botMark);
        currentBoard[i] = '';
        if (score > bestScore) {
          bestScore = score;
          bestMove = i;
        }
      }
    }

    if (bestMove != -1) {
      final newBoard = List.of(state.board);
      newBoard[bestMove] = botMark;
      state = state.copyWith(board: newBoard);
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
      return 0;
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
    if (state.winner == userMark) {
      return 'Você';
    } else {
      return 'CPU';
    }
  }

  Future<void> saveHistory(String winner, String userMark) async {
    final databaseService = ref.read(databaseServiceProvider);
    String mode = getGameResult(userMark);
    final history = History(
      winner: winner,
      mode: mode,
      boardState: state.board.join(','),
      date: DateTime.now().toIso8601String(),
      level: state.difficulty.level,
    );
    await databaseService.insertHistory(history);
  }
}
