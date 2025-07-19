enum Difficulty {
  easy(1, 'Facil'),
  medium(2, 'Medio'),
  hard(3, 'Dificil');

  final int level;
  final String label;
  const Difficulty(this.level, this.label);

  static Difficulty fromLevel(int level) {
    return Difficulty.values.firstWhere((e) => e.level == level);
  }

  static Difficulty fromLabel(String label) {
    return Difficulty.values.firstWhere((e) => e.label == label);
  }

  /*static List<Difficulty> getDifficultyOptions() {
    return [Difficulty.easy, Difficulty.medium, Difficulty.hard];
  }*/
}
