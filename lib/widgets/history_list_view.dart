import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tic_tac_toe/core/constants/difficulty.dart';
import 'package:tic_tac_toe/models/history.dart';
import 'package:tic_tac_toe/widgets/card_history.dart';

/// A widget that displays the list of historical game records.
class HistoryListView extends StatelessWidget {
  final List<History> gameHistory;
  final Future<void> Function(int id, int index) onDeleteItem;

  const HistoryListView({
    super.key,
    required this.gameHistory,
    required this.onDeleteItem,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      itemCount: gameHistory.length,
      itemBuilder: (context, index) {
        final history = gameHistory[index];
        return _buildDismissibleItem(context, history, index);
      },
    );
  }

  Widget _buildDismissibleItem(
    BuildContext context,
    History history,
    int index,
  ) {
    return Dismissible(
      key: ValueKey(history.id),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        onDeleteItem(history.id!, index);
      },
      background: _buildDismissibleBackground(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
        child: CardHistory(
          winner: history.winner,
          date: DateFormat(
            'dd/MM/yyyy HH:mm',
          ).format(DateTime.parse(history.date)),
          mode: history.mode,
          board: history.board,
          level: Difficulty.fromLevel(history.level).getLabel(context),
        ),
      ),
    );
  }

  Widget _buildDismissibleBackground() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
      decoration: BoxDecoration(
        color: Colors.red.shade700,
        borderRadius: BorderRadius.circular(16),
      ),
      alignment: Alignment.centerRight,
      padding: const EdgeInsets.only(right: 20.0),
      child: const Icon(Icons.delete_outline, color: Colors.white),
    );
  }
}
