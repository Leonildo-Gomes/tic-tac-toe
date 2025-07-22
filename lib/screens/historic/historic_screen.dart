import 'package:flutter/material.dart';
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
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Histórico eliminado com sucesso!')),
      );
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
          content: const Text('Partida eliminada.'),
          action: SnackBarAction(
            label: 'DESFAZER',
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
          title: const Text('Confirmar Exclusão'),
          content: const Text(
            'Tem a certeza de que deseja eliminar todo o histórico de partidas? Esta ação não pode ser desfeita.',
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancelar'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: const Text('Eliminar'),
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
        title: const Text('Histórico de Partidas'),
        backgroundColor: theme.colorScheme.surface,
        scrolledUnderElevation: 0,
        actions: [
          if (gameHistory.isNotEmpty)
            IconButton(
              icon: const Icon(Icons.delete_sweep_outlined),
              tooltip: 'Eliminar todo o histórico',
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
