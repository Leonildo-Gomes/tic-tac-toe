import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

/// A widget to display when the game history is empty.
class EmptyHistoryView extends StatelessWidget {
  const EmptyHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.history_toggle_off_rounded, size: 80),
          const SizedBox(height: 16),
          Text(
            'Nenhuma partida encontrada',
            style: theme.textTheme.titleLarge,
          ),
          const SizedBox(height: 8),
          Text(
            'Jogue uma partida para ver o histórico.',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ).animate().fade(duration: 500.ms),
    );
  }
}
