import 'package:flutter/material.dart';

class PlayerScoreCard extends StatelessWidget {
  final String label;
  final int score;
  final bool isTurn;

  const PlayerScoreCard({
    super.key,
    required this.label,
    required this.score,
    required this.isTurn,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    final backgroundColor = isTurn
        ? colorScheme.primaryContainer
        : colorScheme.surfaceContainerHigh;
    final textColor = isTurn
        ? colorScheme.onPrimaryContainer
        : colorScheme.onSurfaceVariant;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        children: [
          Text(
            label,
            style: textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4),
          Text(
            '$score Vitórias',
            style: textTheme.bodyMedium?.copyWith(color: textColor),
          ),
        ],
      ),
    );
  }
}
