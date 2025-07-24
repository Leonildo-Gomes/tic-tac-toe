import 'package:tic_tac_toe/core/constants/difficulty.dart';

class GameState {
  final List<String> board;
  final List<int> matchedIndexes;
  final bool gameOver;
  final bool isUserTurn;
  final String? winner;
  final Difficulty difficulty;
  final String userMark;

  GameState({
    required this.board,
    required this.matchedIndexes,
    required this.gameOver,
    required this.isUserTurn,
    this.winner,
    required this.difficulty,
    required this.userMark,
  });

  GameState copyWith({
    List<String>? board,
    List<int>? matchedIndexes,
    bool? gameOver,
    bool? isUserTurn,
    String? winner,
    Difficulty? difficulty,
    String? userMark,
  }) {
    return GameState(
      board: board ?? this.board,
      matchedIndexes: matchedIndexes ?? this.matchedIndexes,
      gameOver: gameOver ?? this.gameOver,
      isUserTurn: isUserTurn ?? this.isUserTurn,
      winner: winner,
      difficulty: difficulty ?? this.difficulty,
      userMark: userMark ?? this.userMark,
    );
  }
}
