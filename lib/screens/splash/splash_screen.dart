import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
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
    await Future.delayed(const Duration(seconds: 5)); // 3-second delay
    if (mounted) {
      Navigator.pushReplacementNamed(context, HomeScreen.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    //final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [theme.colorScheme.primary, theme.colorScheme.secondary],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                    'Jogo da Velha',
                    style: theme.textTheme.displayMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: theme.colorScheme.onPrimary,
                    ),
                  )
                  .animate()
                  .fade(duration: 800.ms, curve: Curves.easeIn)
                  .slideY(
                    begin: 0.5,
                    end: 0,
                    duration: 800.ms,
                    curve: Curves.easeOut,
                  ),
              const SizedBox(height: 16),
              const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ).animate().fade(delay: 1000.ms, duration: 500.ms),
            ],
          ),
        ),
      ),
    ).animate().shimmer(duration: 1500.ms);
  }
}
