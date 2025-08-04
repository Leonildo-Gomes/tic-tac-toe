import 'package:flutter/material.dart';
import 'package:tic_tac_toe/core/utils/context_extensions.dart';

class EndGameDialog extends StatelessWidget {
  final String? winner;
  final VoidCallback onPlayAgain;

  const EndGameDialog({
    super.key,
    required this.winner,
    required this.onPlayAgain,
  });
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    final isWinner = winner != null && winner != 'empate';
    final isTie = winner == 'empate';
    final title = isWinner ? context.l10n.winner : context.l10n.draw;

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24.0)),
      backgroundColor: colorScheme.surfaceContainerHigh,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            if (isWinner) Image.asset('assets/images/trophy.png', height: 80),
            if (isTie)
              Icon(
                Icons.sentiment_dissatisfied_rounded,
                size: 80,
                color: colorScheme.onSurfaceVariant,
              ),
            const SizedBox(height: 16),
            Text(
              title,
              style: textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: colorScheme.onSurface,
              ),
            ),
            if (isWinner)
              Text(
                '$winner',
                style: textTheme.displayLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: colorScheme.primary,
                ),
              ),
            const SizedBox(height: 24),
            FilledButton.icon(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog first
                onPlayAgain(); // Then call the callback
              },
              icon: const Icon(Icons.replay_rounded),
              label: Text(context.l10n.playAgain),
              style: FilledButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
