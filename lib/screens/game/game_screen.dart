import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tic_tac_toe/core/constants/difficulty.dart';
import 'package:tic_tac_toe/core/controllers/game_controller.dart';
import 'package:tic_tac_toe/models/game_state.dart';
import 'package:tic_tac_toe/widgets/end_game_dialog.dart';
import 'package:tic_tac_toe/widgets/game_board.dart';
import 'package:tic_tac_toe/widgets/score_indicator.dart';

class GameScreen extends ConsumerStatefulWidget {
  static const String routeName = 'GameScreen';
  final String userMark;
  final Difficulty selectedDifficulty;

  const GameScreen({
    super.key,
    required this.userMark,
    required this.selectedDifficulty,
  });

  @override
  ConsumerState<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends ConsumerState<GameScreen> {
  final Random _random = Random();
  int _userWins = 0;
  int _botWins = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initializeGame();
    });
  }

  void _initializeGame() {
    final gameNotifier = ref.read(gameControllerProvider.notifier);
    gameNotifier.initGame(widget.selectedDifficulty, widget.userMark);

    final bool userPlaysFirst = _random.nextBool();
    if (!userPlaysFirst) {
      gameNotifier.computerMove();
    }
  }

  void _resetGame() {
    ref.read(gameControllerProvider.notifier).resetGame();
    _initializeGame();
  }

  void _handleTap(int index) {
    final gameNotifier = ref.read(gameControllerProvider.notifier);
    gameNotifier.makeMove(index);
  }

  void _updateScores(String? winner) {
    if (winner == widget.userMark) {
      setState(() => _userWins++);
    } else if (winner != null && winner != 'empate') {
      setState(() => _botWins++);
    }
  }

  void _showEndGameDialog(String? winner) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return EndGameDialog(winner: winner, onPlayAgain: _resetGame);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final gameState = ref.watch(gameControllerProvider);
    final gameNotifier = ref.read(gameControllerProvider.notifier);

    ref.listen<GameState>(gameControllerProvider, (previous, next) {
      if (next.gameOver && !previous!.gameOver) {
        _updateScores(next.winner);
        _showEndGameDialog(next.winner);
      }
    });

    return Scaffold(
      backgroundColor: theme.colorScheme.surfaceContainerLow,
      appBar: AppBar(
        title: const Text('Jogo da Velha'),
        backgroundColor: theme.colorScheme.surfaceContainerLow,
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
                botMark: gameNotifier.botMark,
                isUserTurn: gameState.isUserTurn,
              ).animate().fade(duration: 500.ms).slideY(begin: -0.2, end: 0),
              Expanded(
                child: Center(
                  child: GameBoard(gameState: gameState, onTileTap: _handleTap),
                ),
              ),
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
              ).animate().fade(duration: 500.ms).slideY(begin: 0.2, end: 0),
            ],
          ),
        ),
      ),
    );
  }
}
