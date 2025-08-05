import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tic_tac_toe/core/controllers/game_controller.dart';
import 'package:tic_tac_toe/models/game_state.dart';

final gameControllerProvider = NotifierProvider<GameController, GameState>(
  GameController.new,
);
