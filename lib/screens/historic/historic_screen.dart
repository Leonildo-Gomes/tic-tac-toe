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
    return Scaffold(
      appBar: AppBar(title: Text('Histórico'), centerTitle: true),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: gameHistory.length,
              itemBuilder: (context, index) {
                final history = gameHistory[index];
                final date = DateTime.parse(history.date);
                return CardHistory(
                  name:
                      'Jogador ${history.winner}', // Corrected string interpolation
                  date: DateFormat('dd/MM/yyyy HH:mm').format(date),
                  mode: history.mode,
                  board: history.board,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

/*
 
 
*/
