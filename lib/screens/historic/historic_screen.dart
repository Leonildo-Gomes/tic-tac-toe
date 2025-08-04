import 'package:flutter/material.dart';
import 'package:tic_tac_toe/core/utils/context_extensions.dart';
import 'package:tic_tac_toe/models/history.dart';
import 'package:tic_tac_toe/services/database_service.dart';
import 'package:tic_tac_toe/widgets/empty_history_view.dart';
import 'package:tic_tac_toe/widgets/history_list_view.dart';

class HistoricScreen extends StatefulWidget {
  const HistoricScreen({super.key});
  static const String routeName = 'HistoricScreen';

  @override
  State<HistoricScreen> createState() => _HistoricScreenState();
}

class _HistoricScreenState extends State<HistoricScreen> {
  List<History> gameHistory = [];

  @override
  void initState() {
    super.initState();
    _loadHistory();
  }

  // --- Data Handling Methods ---

  Future<void> _loadHistory() async {
    final List<History> history = await DatabaseService.instance.getHistory();
    if (mounted) {
      setState(() {
        gameHistory = history.reversed.toList();
      });
    }
  }

  Future<void> _clearHistory() async {
    await DatabaseService.instance.clearHistory();
    _loadHistory();
    if (mounted) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(context.l10n.historyCleared)));
    }
  }

  Future<void> _deleteHistoryItem(int id, int index) async {
    final historyItem = gameHistory[index];
    setState(() {
      gameHistory.removeAt(index);
    });

    await DatabaseService.instance.deleteHistory(id);

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(context.l10n.matchDeleted),
          action: SnackBarAction(
            label: context.l10n.undo,
            onPressed: () {
              DatabaseService.instance
                  .insertHistory(historyItem)
                  .then((_) => _loadHistory());
            },
          ),
        ),
      );
    }
  }

  // --- UI Methods ---

  void _showClearHistoryConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(context.l10n.confirmExclusion),
          content: Text(context.l10n.confirmClearHistory),
          actions: <Widget>[
            TextButton(
              child: Text(context.l10n.cancel),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: Text(context.l10n.clear),
              onPressed: () {
                Navigator.of(context).pop();
                _clearHistory();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.historyGame),
        backgroundColor: theme.colorScheme.surface,
        scrolledUnderElevation: 0,
        actions: [
          if (gameHistory.isNotEmpty)
            IconButton(
              icon: const Icon(Icons.delete_sweep_outlined),
              tooltip: context.l10n.clearAllHistory,
              onPressed: _showClearHistoryConfirmationDialog,
            ),
        ],
      ),
      body: SafeArea(
        child: gameHistory.isEmpty
            ? const EmptyHistoryView()
            : HistoryListView(
                gameHistory: gameHistory,
                onDeleteItem: _deleteHistoryItem,
              ),
      ),
    );
  }
}
