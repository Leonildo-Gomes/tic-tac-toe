import 'package:flutter/material.dart';
import 'package:tic_tac_toe/screens/game/game_screen.dart';

class MarkButton extends StatelessWidget {
  final String userMark;
  final Icon icon;
  final String selectedDifficulty;
  const MarkButton({
    super.key,
    required this.userMark,
    required this.icon,
    required this.selectedDifficulty,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => GameScreen(
              userMark: userMark,
              selectedDifficulty: selectedDifficulty,
            ),
          ),
        );
      },
      icon: icon,
      label: Text('Play as $userMark'),
    );
  }
}
