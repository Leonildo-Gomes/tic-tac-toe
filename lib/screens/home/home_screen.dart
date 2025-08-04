import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tic_tac_toe/core/utils/context_extensions.dart';
import 'package:tic_tac_toe/screens/historic/historic_screen.dart';
import 'package:tic_tac_toe/screens/menu/menu_screen.dart';
import 'package:tic_tac_toe/screens/settings/settings_screen.dart';

class HomeScreen extends ConsumerWidget {
  static const String routeName = 'HomeScreen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenHeight = MediaQuery.of(context).size.height;
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.surfaceContainerLow,
      appBar: AppBar(
        backgroundColor: theme.colorScheme.surfaceContainerLow,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            tooltip: context.l10n.historyGame,
            onPressed: () =>
                Navigator.pushNamed(context, SettingsScreen.routeName),
          ),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 400),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 32,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Image.asset(
                          'assets/images/tic-tac-toe.png',
                          height: screenHeight * 0.12,
                          color: theme.colorScheme.onSurface,
                        )
                        .animate()
                        .fade(duration: 500.ms)
                        .scale(delay: 300.ms, duration: 500.ms),
                    const SizedBox(height: 24),
                    Text(
                          context.l10n.appTitle,
                          textAlign: TextAlign.center,
                          style: theme.textTheme.displaySmall?.copyWith(
                            color: theme.colorScheme.onSurface,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                        .animate()
                        .fade(delay: 500.ms, duration: 500.ms)
                        .slideY(begin: 0.5, end: 0),
                    const SizedBox(height: 8),
                    Text(
                          context.l10n.challengeYourself,
                          textAlign: TextAlign.center,
                          style: theme.textTheme.bodyLarge?.copyWith(
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                        )
                        .animate()
                        .fade(delay: 700.ms, duration: 500.ms)
                        .slideY(begin: 0.5, end: 0),
                    const SizedBox(height: 48),
                    FilledButton.icon(
                          icon: const Icon(Icons.play_arrow_rounded),
                          label: Text(context.l10n.startGame),
                          onPressed: () {
                            Navigator.pushNamed(context, MenuScreen.routeName);
                          },
                          style: FilledButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            textStyle: theme.textTheme.titleMedium,
                          ),
                        )
                        .animate()
                        .fade(delay: 900.ms, duration: 500.ms)
                        .slideY(begin: 0.5, end: 0),
                    const SizedBox(height: 16),
                    OutlinedButton.icon(
                          icon: const Icon(Icons.history_rounded),
                          label: Text(context.l10n.history),
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              HistoricScreen.routeName,
                            );
                          },
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            textStyle: theme.textTheme.titleMedium,
                          ),
                        )
                        .animate()
                        .fade(delay: 1100.ms, duration: 500.ms)
                        .slideY(begin: 0.5, end: 0),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
