import 'package:flutter/material.dart';
import 'package:tic_tac_toe/core/constants/player.dart';

/// A card widget to display a summary of a past game.
///
/// It shows the winner, date, game mode, and a miniature representation of the
/// final game board. The code is structured with named constants for spacing
/// and decomposed into smaller builder methods for clarity and maintainability.
class CardHistory extends StatelessWidget {
  final String name;
  final String date;
  final String mode;
  final List<String> board;

  const CardHistory({
    super.key,
    required this.name,
    required this.date,
    required this.mode,
    required this.board,
  });

  // Using static const for layout values improves readability and maintainability.
  static const _kCardPadding = EdgeInsets.all(12.0);
  static const _kHorizontalSpacing = 16.0;
  static const _kVerticalSpacing = 4.0;
  static const _kMiniBoardSize = 54.0;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: _kCardPadding,
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: _kVerticalSpacing),
                  Text('Data: $date', style: textTheme.bodySmall),
                  const SizedBox(height: _kVerticalSpacing * 2),
                  _buildModeIndicator(textTheme, colorScheme),
                ],
              ),
            ),
            const SizedBox(width: _kHorizontalSpacing),
            _buildMiniBoard(context, colorScheme, textTheme),
          ],
        ),
      ),
    );
  }

  /// Builds the small indicator for the game mode (CPU or Player).
  Widget _buildModeIndicator(TextTheme textTheme, ColorScheme colorScheme) {
    return Row(
      children: [
        Icon(
          mode == 'CPU' ? Icons.computer : Icons.person,
          color: colorScheme.onSurfaceVariant,
          size: 16,
        ),
        const SizedBox(width: 8),
        Text(mode, style: textTheme.bodyMedium),
      ],
    );
  }

  /// Builds the 3x3 mini-board showing the final state of the game.
  Widget _buildMiniBoard(
    BuildContext context,
    ColorScheme colorScheme,
    TextTheme textTheme,
  ) {
    return SizedBox(
      width: _kMiniBoardSize,
      height: _kMiniBoardSize,
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 2,
          crossAxisSpacing: 2,
        ),
        itemCount: board.length,
        itemBuilder: (context, index) {
          final mark = board[index];
          final Color markColor;

          if (mark == Player.PLAYER_X) {
            markColor = colorScheme.primary;
          } else if (mark == Player.PLAYER_O) {
            markColor = colorScheme.error;
          } else {
            markColor = colorScheme.onSurfaceVariant;
          }

          return Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: colorScheme.surfaceContainerHighest.withOpacity(0.6),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              mark,
              style: textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: markColor,
              ),
            ),
          );
        },
      ),
    );
  }
}
