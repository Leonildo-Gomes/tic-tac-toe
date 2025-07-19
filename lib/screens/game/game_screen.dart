import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tic_tac_toe/core/constants/constant.dart';
import 'package:tic_tac_toe/core/constants/difficulty.dart';
import 'package:tic_tac_toe/core/constants/player.dart';
import 'package:tic_tac_toe/core/controllers/game_controller.dart';
import 'package:tic_tac_toe/services/database_service.dart';
import 'package:tic_tac_toe/widgets/end_game_dialog.dart';
import 'package:tic_tac_toe/widgets/score_indicator.dart';

class GameScreen extends StatefulWidget {
  static const String routeName = 'GameScreen';
  final String userMark;
  final Difficulty selectedDifficulty;

  const GameScreen({
    super.key,
    required this.userMark,
    required this.selectedDifficulty,
  });

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  late GameController _gameController;
  final DatabaseService databaseService = DatabaseService.instance;
  final Random _random = Random();
  int _userWins = 0;
  int _botWins = 0;

  @override
  void initState() {
    super.initState();
    _initializeGame();
  }

  void _initializeGame() {
    _gameController = GameController(
      databaseService,
      widget.selectedDifficulty,
      widget.userMark,
    );
    final bool userPlaysFirst = _random.nextBool();

    if (!userPlaysFirst) {
      _gameController.isUserTurn = false;
      Timer(
        const Duration(milliseconds: 500),
        () => setState(() => _gameController.computerMove()),
      );
    }
  }

  void _resetGame() {
    setState(() {
      _gameController.resetGame();
      _initializeGame();
    });
  }

  void _handleTap(int index) {
    if (_gameController.gameOver ||
        !_gameController.isUserTurn ||
        _gameController.board[index].isNotEmpty) {
      return;
    }

    setState(() {
      _gameController.makeMove(index);
      if (_gameController.gameOver) {
        _updateScores();
        _showEndGameDialog();
      }
    });
  }

  void _updateScores() {
    if (_gameController.winner == widget.userMark) {
      _userWins++;
    } else if (_gameController.winner != null &&
        _gameController.winner != 'empate') {
      _botWins++;
    }
  }

  void _showEndGameDialog() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return EndGameDialog(
          winner: _gameController.winner,
          onPlayAgain: _resetGame,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jogo da Velha'),
        backgroundColor: theme.colorScheme.surface,
        scrolledUnderElevation: 0,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ScoreIndicator(
                userMark: widget.userMark,
                userWins: _userWins,
                botWins: _botWins,
                botMark: _gameController.botMark,
                isUserTurn: _gameController.isUserTurn,
              ),
              Expanded(child: Center(child: _buildGameBoard())),
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: OutlinedButton.icon(
                  onPressed: _resetGame,
                  icon: const Icon(Icons.refresh_rounded),
                  label: const Text('Reiniciar Jogo'),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGameBoard() {
    final screenWidth = MediaQuery.of(context).size.width;
    final boardSize = screenWidth > 600 ? 400.0 : screenWidth * 0.85;
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: boardSize, maxHeight: boardSize),
      child: GridView.builder(
        itemCount: Constant.boardSize,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        itemBuilder: (context, index) {
          final mark = _gameController.board[index];
          final isMatched = _gameController.matchedIndexes.contains(index);

          final Color markColor;
          if (mark == Player.playerX) {
            markColor = colorScheme.primary;
          } else if (mark == Player.playerO) {
            markColor = colorScheme.tertiary;
          } else {
            markColor = Colors.transparent; // No color for empty cells
          }

          final cellColor = isMatched
              ? colorScheme.primary
              : colorScheme.surfaceContainerHigh;
          final textColor = isMatched ? colorScheme.onPrimary : markColor;

          return Material(
            color: cellColor,
            borderRadius: BorderRadius.circular(16),
            child: InkWell(
              onTap: () => _handleTap(index),
              borderRadius: BorderRadius.circular(16),
              child: Center(
                child: Text(
                  mark,
                  style: textTheme.displayLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
