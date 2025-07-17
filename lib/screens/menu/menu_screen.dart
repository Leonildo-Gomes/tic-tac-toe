import 'package:flutter/material.dart';
import 'package:tic_tac_toe/core/constants/player.dart';
import 'package:tic_tac_toe/screens/game/game_screen.dart';

class MenuScreen extends StatefulWidget {
  static const String routeName = 'MenuScreen';
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  String _selectedDifficulty = 'Basico';
  final List<String> _difficulties = ['Basico', 'Avancado'];
  String _selectedMark = Player.playerX;

  void _startGame() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => GameScreen(
          userMark: _selectedMark,
          selectedDifficulty: _selectedDifficulty,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Nova Partida'),
        backgroundColor: theme.colorScheme.surface,
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
                /*decoration: BoxDecoration(
                  color: theme.colorScheme.surfaceContainerHigh,
                  borderRadius: BorderRadius.circular(24),
                ),*/
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 32,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Nível de Jogo',
                      style: theme.textTheme.titleLarge?.copyWith(
                        color: theme.colorScheme.onSurface,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    SegmentedButton<String>(
                      segments: _difficulties.map((level) {
                        return ButtonSegment<String>(
                          value: level,
                          label: Text(level),
                        );
                      }).toList(),
                      selected: <String>{_selectedDifficulty},
                      onSelectionChanged: (Set<String> newSelection) {
                        setState(() {
                          _selectedDifficulty = newSelection.first;
                        });
                      },
                    ),
                    const SizedBox(height: 32),
                    Text(
                      'Escolha seu lado',
                      style: theme.textTheme.titleLarge?.copyWith(
                        color: theme.colorScheme.onSurface,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    SegmentedButton<String>(
                      segments: <ButtonSegment<String>>[
                        ButtonSegment<String>(
                          value: Player.playerX,
                          icon: const Text('X', style: TextStyle(fontSize: 20)),
                        ),
                        ButtonSegment<String>(
                          value: Player.playerO,
                          icon: const Text('O', style: TextStyle(fontSize: 20)),
                        ),
                      ],
                      selected: <String>{_selectedMark},
                      onSelectionChanged: (Set<String> newSelection) {
                        setState(() {
                          _selectedMark = newSelection.first;
                        });
                      },
                    ),
                    const SizedBox(height: 40),
                    FilledButton.icon(
                      icon: const Icon(Icons.play_arrow_rounded),
                      label: const Text('Iniciar Jogo'),
                      onPressed: _startGame,
                      style: FilledButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        textStyle: theme.textTheme.titleMedium,
                      ),
                    ),
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
