import 'package:flutter/material.dart';
import 'package:tic_tac_toe/screens/historic/historic_screen.dart';
import 'package:tic_tac_toe/screens/menu/menu_screen.dart';
import 'package:tic_tac_toe/widgets/custom_button.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = 'HomeScreen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20),
            width: screenWidth * 0.8,
            constraints: const BoxConstraints(maxWidth: 400),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                Image.asset(
                  'assets/images/tic-tac-toe.png',
                  height: screenHeight * 0.2,
                ),
                const SizedBox(height: 20),
                Text(
                  'Jogo da Velha',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 20),
                CustomButton(
                  text: 'Iniciar Jogo',
                  icon: Icons.play_arrow,
                  onPressed: () {
                    Navigator.pushNamed(context, MenuScreen.routeName);
                  },
                ),
                const SizedBox(height: 10),
                CustomButton(
                  text: 'Histórico',
                  icon: Icons.history,
                  onPressed: () {
                    Navigator.pushNamed(context, HistoricScreen.routeName);
                  },
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
