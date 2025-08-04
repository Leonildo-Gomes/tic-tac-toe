import 'package:flutter/material.dart';
import 'package:tic_tac_toe/core/utils/context_extensions.dart';
import 'package:tic_tac_toe/widgets/player_score_card.dart';

class ScoreIndicator extends StatelessWidget {
  final String userMark;
  final int userWins;
  final int botWins;
  final String botMark;
  final bool isUserTurn;

  const ScoreIndicator({
    super.key,
    required this.userMark,
    required this.userWins,
    required this.botWins,
    required this.botMark,
    required this.isUserTurn,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          child: PlayerScoreCard(
            label: '${context.l10n.you} ($userMark)',
            score: userWins,
            isTurn: isUserTurn,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: PlayerScoreCard(
            label: '${context.l10n.cpu} ($botMark)',
            score: botWins,
            isTurn: !isUserTurn,
          ),
        ),
      ],
    );
  }
}
