import 'package:flutter/material.dart';
import 'package:tic_tac_toe/core/theme/theme.dart';
import 'package:tic_tac_toe/core/utils/util.dart';
import 'package:tic_tac_toe/screens/historic/historic_screen.dart';
import 'package:tic_tac_toe/screens/home/home_screen.dart';
import 'package:tic_tac_toe/screens/menu/menu_screen.dart';
import 'package:tic_tac_toe/screens/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = createTextTheme(context, "Roboto", "Luckiest Guy");
    MaterialTheme appTheme = MaterialTheme(textTheme);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Jogo da Velha',
      theme: appTheme.light(),
      darkTheme: appTheme.dark(),
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (context) => const SplashScreen(),
        HomeScreen.routeName: (context) => const HomeScreen(),
        MenuScreen.routeName: (context) => const MenuScreen(),
        HistoricScreen.routeName: (context) => const HistoricScreen(),
      },
    );
  }
}
