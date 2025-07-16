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
  String _selectedMark = Player.PLAYER_X;

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
    return Scaffold(
      appBar: AppBar(title: const Text('Configurações')),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          constraints: const BoxConstraints(maxWidth: 400),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.settings, size: 50),
              const SizedBox(height: 20),
              const Text('Nível de Jogo', style: TextStyle(fontSize: 20)),
              const SizedBox(height: 10),
              DropdownButton<String>(
                value: _selectedDifficulty,
                items: _difficulties.map<DropdownMenuItem<String>>((
                  String value,
                ) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  if (newValue != null) {
                    setState(() {
                      _selectedDifficulty = newValue;
                    });
                  }
                },
              ),
              const SizedBox(height: 20),
              const Text('Escolha seu lado', style: TextStyle(fontSize: 20)),
              const SizedBox(height: 10),
              SegmentedButton<String>(
                segments: <ButtonSegment<String>>[
                  ButtonSegment<String>(
                    //icon: const Icon(Icons.close),
                    value: Player.PLAYER_X,
                    label: Text('Play as X '),
                  ),
                  ButtonSegment<String>(
                    //icon: const Icon(Icons.circle_outlined),
                    value: Player.PLAYER_O,
                    label: Text('Play as O'),
                  ),
                ],
                selected: <String>{_selectedMark},
                onSelectionChanged: (Set<String> newSelection) {
                  setState(() {
                    _selectedMark = newSelection.first;
                  });
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _startGame,
                child: const Text('Iniciar Jogo'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
