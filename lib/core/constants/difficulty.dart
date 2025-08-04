import 'package:flutter/material.dart';
import 'package:tic_tac_toe/core/utils/context_extensions.dart';

enum Difficulty {
  easy(1),
  medium(2),
  hard(3);

  final int level;
  const Difficulty(this.level);

  String getLabel(BuildContext context) {
    switch (this) {
      case Difficulty.easy:
        return context.l10n.difficultyEasy;
      case Difficulty.medium:
        return context.l10n.difficultyMedium;
      case Difficulty.hard:
        return context.l10n.difficultyHard;
    }
  }

  static Difficulty fromLevel(int level) {
    return Difficulty.values.firstWhere((e) => e.level == level);
  }
}
