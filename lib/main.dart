import 'package:flutter/material.dart';
import 'package:tic_tac_toe/core/constants/player.dart';
import 'package:tic_tac_toe/screens/game/game_screen.dart';
import 'package:tic_tac_toe/screens/historic/historic_screen.dart';
import 'package:tic_tac_toe/screens/home/home_screen.dart';
import 'package:tic_tac_toe/screens/menu/menu_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => const HomeScreen(),
        MenuScreen.routeName: (context) => const MenuScreen(),
        HistoricScreen.routeName: (context) => const HistoricScreen(),
        GameScreen.routeName: (context) => const GameScreen(
          userMark: Player.PLAYER_O,
          selectedDifficulty: 'Basico',
        ),
      },
    );
  }
}
