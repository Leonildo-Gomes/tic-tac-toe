import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tic_tac_toe/models/history.dart';
import 'package:tic_tac_toe/services/database_service.dart';
import 'package:tic_tac_toe/widgets/card_history.dart';

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

  Future<void> _loadHistory() async {
    final List<History> history = await DatabaseService.instance.getHistory();
    setState(() {
      gameHistory = history;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Histórico de Partidas'),
        backgroundColor: theme.colorScheme.surface,
        scrolledUnderElevation: 0,
      ),
      body: SafeArea(
        child: gameHistory.isEmpty
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.history_toggle_off_rounded, size: 80),
                    const SizedBox(height: 16),
                    Text(
                      'Nenhuma partida encontrada',
                      style: theme.textTheme.titleLarge,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Jogue uma partida para ver o histórico.',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              )
            : ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                itemCount: gameHistory.length,
                itemBuilder: (context, index) {
                  final history = gameHistory[index];
                  final date = DateTime.parse(history.date);
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 6.0,
                    ),
                    child: CardHistory(
                      name: history.winner == 'empate'
                          ? 'Empate'
                          : 'Vencedor: ${history.winner}',
                      date: DateFormat('dd/MM/yyyy HH:mm').format(date),
                      mode: history.mode,
                      board: history.board,
                    ),
                  );
                },
              ),
      ),
    );
  }
}

/*
 
 
*/
