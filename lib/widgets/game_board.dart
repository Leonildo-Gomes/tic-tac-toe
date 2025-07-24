import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:tic_tac_toe/core/constants/constant.dart';
import 'package:tic_tac_toe/core/constants/player.dart';
import 'package:tic_tac_toe/models/game_state.dart';

class GameBoard extends StatelessWidget {
  final GameState gameState;
  final ValueChanged<int> onTileTap;

  const GameBoard({super.key, required this.gameState, required this.onTileTap});

  @override
  Widget build(BuildContext context) {
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
          final mark = gameState.board[index];
          final isMatched = gameState.matchedIndexes.contains(index);

          final Color markColor;
          if (mark == Player.playerX) {
            markColor = colorScheme.primary;
          } else if (mark == Player.playerO) {
            markColor = colorScheme.tertiary;
          } else {
            markColor = Colors.transparent;
          }

          final cellColor = isMatched
              ? colorScheme.primary
              : colorScheme.surfaceContainerHigh;
          final textColor = isMatched ? colorScheme.onPrimary : markColor;

          return Material(
            color: cellColor,
            borderRadius: BorderRadius.circular(16),
            child: InkWell(
              onTap: () => onTileTap(index),
              borderRadius: BorderRadius.circular(16),
              child: Center(
                child: Text(
                  mark,
                  style: textTheme.displayLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
                ).animate(target: mark.isNotEmpty ? 1 : 0).scale(duration: 300.ms),
              ),
            ),
          ).animate().fade(delay: (50 * index).ms, duration: 400.ms).slideY(begin: 0.5, end: 0);
        },
      ),
    ).animate().fade(duration: 600.ms);
  }
}
