class History {
  final int? id;
  final String winner;
  final String mode;
  final String boardState;
  final String date;

  History({
    this.id,
    required this.winner,
    required this.mode,
    required this.boardState,
    required this.date,
  });

  static const String tableName = 'history';
  static const String columnId = 'id';
  static const String columnWinner = 'winner';
  static const String columnMode = 'mode';
  static const String columnBoardState = 'boardState';
  static const String columnDate = 'date';

  Map<String, dynamic> toMap() {
    return {
      // ID is not included for insertion as it is auto-generated.
      columnWinner: winner,
      columnBoardState: boardState,
      columnMode: mode,
      columnDate: date, // Use the date from the object.
    };
  }

  factory History.fromMap(Map<String, dynamic> map) {
    return History(
      id: map[columnId], // Read the ID from the database map.
      winner: map[columnWinner],
      boardState: map[columnBoardState],
      mode: map[columnMode],
      date: map[columnDate],
    );
  }

  /// Returns the board state as a list of strings.
  List<String> get board => boardState.split(',');
}
