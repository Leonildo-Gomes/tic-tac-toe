import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:tic_tac_toe/screens/historic/historic_screen.dart';
import 'package:tic_tac_toe/screens/menu/menu_screen.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = 'HomeScreen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: theme.colorScheme.surfaceContainerLow,
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
                        )
                        .animate()
                        .fade(duration: 500.ms)
                        .scale(delay: 300.ms, duration: 500.ms),
                    const SizedBox(height: 24),
                    Text(
                          'Jogo da Velha',
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
                          'Desafie-te a si mesmo!',
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
                          label: const Text('Iniciar Jogo'),
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
                          label: const Text('Histórico'),
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
