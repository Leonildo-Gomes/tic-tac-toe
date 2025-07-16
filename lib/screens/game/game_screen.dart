import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tic_tac_toe/core/constants/constant.dart';
import 'package:tic_tac_toe/core/controllers/game_controller.dart';
import 'package:tic_tac_toe/services/database_service.dart';
import 'package:tic_tac_toe/widgets/custom_button.dart';

class GameScreen extends StatefulWidget {
  static const String routeName = 'GameScreen';
  final String userMark;
  final String selectedDifficulty;

  const GameScreen({
    super.key,
    required this.userMark,
    required this.selectedDifficulty,
  });

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  late GameController _gameController;
  final DatabaseService databaseService = DatabaseService.instance;
  final Random _random = Random();

  @override
  void initState() {
    super.initState();
    _initializeGame();
  }

  void _initializeGame() {
    _gameController = GameController(databaseService);
    final bool userPlaysFirst = _random.nextBool();

    if (!userPlaysFirst) {
      _gameController.isUserTurn = false;
      // A CPU joga primeiro com um pequeno atraso para o jogador perceber.
      Timer(
        const Duration(milliseconds: 500),
        () => setState(() => _gameController.computerMove(widget.userMark)),
      );
    }
  }

  void _resetGame() {
    setState(() {
      _gameController.resetGame();
      _initializeGame();
    });
  }

  void _handleTap(int index) {
    if (_gameController.gameOver ||
        !_gameController.isUserTurn ||
        _gameController.board[index].isNotEmpty) {
      return;
    }

    setState(() {
      _gameController.makeMove(index, widget.userMark);
      if (_gameController.gameOver) {
        _showEndGameDialog();
      }
    });
  }

  void _showEndGameDialog() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        final title = _gameController.winner != null
            ? 'O VENCEDOR É: ${_gameController.winner}'
            : 'EMPATE';
        return AlertDialog(
          title: Text(title, textAlign: TextAlign.center),
          actionsAlignment: MainAxisAlignment.center,
          actions: <Widget>[
            CustomButton(
              onPressed: () {
                Navigator.of(context).pop();
                _resetGame();
              },
              text: 'Jogar Novamente',
              icon: Icons.replay,
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Jogo da Velha'), centerTitle: true),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildTurnIndicator(),
            const SizedBox(height: 20),
            _buildGameBoard(),
            const SizedBox(height: 40),
            CustomButton(
              onPressed: _resetGame,
              text: 'Reiniciar Jogo',
              icon: Icons.refresh,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTurnIndicator() {
    final isUserTurn = _gameController.isUserTurn;
    final turnText = isUserTurn ? 'Sua vez' : 'Vez da CPU';
    final playerMark = isUserTurn
        ? widget.userMark
        : (_gameController.getBotMark(widget.userMark));

    return Text(
      '$turnText ($playerMark)',
      style: Theme.of(context).textTheme.headlineSmall,
    );
  }

  Widget _buildGameBoard() {
    final screenWidth = MediaQuery.of(context).size.width;
    final boardSize = screenWidth > 600 ? 400.0 : screenWidth * 0.9;

    return SizedBox(
      width: boardSize,
      height: boardSize,
      child: GridView.builder(
        itemCount: Constant.BOARD_SIZE,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemBuilder: (context, index) {
          final isMatched = _gameController.matchedIndexes.contains(index);
          final colorScheme = Theme.of(context).colorScheme;

          return GestureDetector(
            onTap: () => _handleTap(index),
            child: Container(
              decoration: BoxDecoration(
                color: isMatched
                    ? colorScheme.primaryContainer
                    : colorScheme.surfaceContainerHighest,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  _gameController.board[index],
                  style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    color: isMatched
                        ? colorScheme.onPrimaryContainer
                        : colorScheme.onSurface,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
