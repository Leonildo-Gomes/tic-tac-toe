import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:tic_tac_toe/core/constants/difficulty.dart';
import 'package:tic_tac_toe/core/constants/player.dart';
import 'package:tic_tac_toe/core/utils/context_extensions.dart';
import 'package:tic_tac_toe/screens/game/game_screen.dart';
import 'package:tic_tac_toe/widgets/selection_group.dart';

class MenuScreen extends StatefulWidget {
  static const String routeName = 'MenuScreen';
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  // Use the enum directly for type safety
  Difficulty _selectedDifficulty = Difficulty.easy;
  String _selectedMark = Player.playerX;

  void _startGame() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => GameScreen(
          userMark: _selectedMark,
          // Pass the enum, not a string
          selectedDifficulty: _selectedDifficulty,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.surfaceContainerLow,
      appBar: AppBar(
        title: Text(context.l10n.newGame),
        backgroundColor: theme.colorScheme.surfaceContainerLow,
        scrolledUnderElevation: 0,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 400),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 32,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SelectionGroup<Difficulty>(
                      title: context.l10n.gameLevel,
                      segments: Difficulty.values.map((level) {
                        return ButtonSegment<Difficulty>(
                          value: level,
                          label: Text(level.getLabel(context)),
                        );
                      }).toList(),
                      selected: {_selectedDifficulty},
                      onSelectionChanged: (newSelection) {
                        setState(() {
                          _selectedDifficulty = newSelection.first;
                        });
                      },
                    )
                        .animate()
                        .fade(delay: 200.ms, duration: 500.ms)
                        .slideY(begin: 0.2, end: 0),
                    const SizedBox(height: 32),
                    SelectionGroup<String>(
                      title: context.l10n.chooseYourSide,
                      segments: const <ButtonSegment<String>>[
                        ButtonSegment<String>(
                          value: Player.playerX,
                          icon: Text('X', style: TextStyle(fontSize: 20)),
                        ),
                        ButtonSegment<String>(
                          value: Player.playerO,
                          icon: Text('O', style: TextStyle(fontSize: 20)),
                        ),
                      ],
                      selected: {_selectedMark},
                      onSelectionChanged: (newSelection) {
                        setState(() {
                          _selectedMark = newSelection.first;
                        });
                      },
                    )
                        .animate()
                        .fade(delay: 400.ms, duration: 500.ms)
                        .slideY(begin: 0.2, end: 0),
                    const SizedBox(height: 40),
                    FilledButton.icon(
                      icon: const Icon(Icons.play_arrow_rounded),
                      label: Text(context.l10n.startGame),
                      onPressed: _startGame,
                      style: FilledButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        textStyle: theme.textTheme.titleMedium,
                      ),
                    )
                        .animate()
                        .fade(delay: 600.ms, duration: 500.ms)
                        .slideY(begin: 0.2, end: 0),
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
