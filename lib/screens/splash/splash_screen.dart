import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:tic_tac_toe/core/utils/context_extensions.dart';
import 'package:tic_tac_toe/screens/home/home_screen.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = 'SplashScreen';

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    // Tempo de espera reduzido para 3 segundos para uma experiência mais rápida
    await Future.delayed(const Duration(seconds: 3));
    if (mounted) {
      Navigator.pushReplacementNamed(context, HomeScreen.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      // Cor de fundo mais limpa, alinhada com o resto do app
      backgroundColor: theme.colorScheme.surfaceContainerLow,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo do jogo para fortalecer a identidade visual
            Image.asset(
              'assets/images/tic-tac-toe.png',
              height: screenHeight * 0.15, // Logo um pouco maior
              color: theme.colorScheme.onSurface,
            )
                .animate()
                .fade(duration: 800.ms)
                .scale(
                  delay: 200.ms,
                  duration: 800.ms,
                  curve: Curves.elasticOut, // Curva de animação mais moderna
                ),
            const SizedBox(height: 24),
            // Título do app posicionado abaixo do logo
            Text(
              context.l10n.appTitle,
              style: theme.textTheme.displaySmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.onSurface,
              ),
            )
                .animate()
                .fade(delay: 800.ms, duration: 800.ms) // Aparece após o logo
                .slideY(
                  begin: 0.5,
                  end: 0,
                  duration: 800.ms,
                  curve: Curves.easeOut,
                ),
          ],
        ),
      ),
    );
  }
}