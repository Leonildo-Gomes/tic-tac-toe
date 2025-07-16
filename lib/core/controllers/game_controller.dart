import 'dart:math';

import 'package:tic_tac_toe/core/constants/constant.dart';
import 'package:tic_tac_toe/models/history.dart';
import 'package:tic_tac_toe/services/database_service.dart';

class GameController {
  List<String> board = List.filled(Constant.BOARD_SIZE, '');
  List<int> matchedIndexes = [];
  bool gameOver = false;
  bool isUserTurn = true;
  String? winner;
  final Random _random = Random();
  final DatabaseService databaseService;

  GameController(this.databaseService);

  bool get isDraw => !board.contains('') && winner == null;

  void resetGame() {
    board = List.filled(Constant.BOARD_SIZE, '');
    gameOver = false;
    matchedIndexes = [];
    winner = null;
    isUserTurn = true;
  }

  makeMove(int index, String userMark) {
    if (gameOver || board[index].isNotEmpty || !isUserTurn) {
      return;
    }

    board[index] = userMark;
    isUserTurn = false;
    _updateGameState(userMark);

    if (!gameOver) {
      computerMove(userMark);
    }
  }

  void _updateGameState(String userMark) {
    const winningCombinations = [
      [0, 1, 2], [3, 4, 5], [6, 7, 8], // Horizontals
      [0, 3, 6], [1, 4, 7], [2, 5, 8], // Verticals
      [0, 4, 8], [2, 4, 6], // Diagonals
    ];

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

  computerMove(String userMark) {
    final availableMoves = <int>[];
    for (int i = 0; i < board.length; i++) {
      if (board[i].isEmpty) {
        availableMoves.add(i);
      }
    }

    if (availableMoves.isNotEmpty) {
      final move = availableMoves[_random.nextInt(availableMoves.length)];
      board[move] = getBotMark(userMark);
      _updateGameState(userMark);
    }

    if (!gameOver) {
      isUserTurn = true;
    }
  }

  String getBotMark(String userMark) {
    return userMark == 'O' ? 'X' : 'O';
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
