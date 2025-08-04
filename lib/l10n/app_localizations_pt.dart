// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get appTitle => 'Jogo da Velha';

  @override
  String get challengeYourself => 'Desafie-se a si mesmo!';

  @override
  String get startGame => 'Iniciar Jogo';

  @override
  String get history => 'Histórico';

  @override
  String get game => 'Jogo';

  @override
  String get restartGame => 'Reiniciar Jogo';

  @override
  String get drawMessage => 'Empate!';

  @override
  String get you => 'Você';

  @override
  String get cpu => 'CPU';

  @override
  String get newGame => 'Nova Partida';

  @override
  String get gameLevel => 'Nível de Jogo';

  @override
  String get chooseYourSide => 'Escolha seu lado';

  @override
  String get difficultyEasy => 'Fácil';

  @override
  String get difficultyMedium => 'Médio';

  @override
  String get difficultyHard => 'Difícil';

  @override
  String winnerMessage(String playerName) {
    return 'O vencedor é $playerName!';
  }

  @override
  String scoreWins(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Vitórias',
      one: '1 Vitória',
    );
    return '$_temp0';
  }

  @override
  String get historyGame => 'Histórico de Partidas';

  @override
  String get clearAllHistory => 'Eliminar todo o histórico';

  @override
  String get historyCleared => 'Histórico eliminado com sucesso!';

  @override
  String get matchDeleted => 'Partida eliminada.';

  @override
  String get undo => 'DESFAZER';

  @override
  String get confirmExclusion => 'Confirmar Exclusão';

  @override
  String get confirmClearHistory =>
      'Tem a certeza de que deseja eliminar todo o histórico de partidas? Esta ação não pode ser desfeita.';

  @override
  String get cancel => 'Cancelar';

  @override
  String get clear => 'Eliminar';

  @override
  String get playerYou => 'Você';

  @override
  String get playerCPU => 'CPU';

  @override
  String get draw => 'Empate';

  @override
  String get level => 'Nível';

  @override
  String winnerIs(String playerName) {
    return 'Vencedor: $playerName';
  }

  @override
  String get noMatchesFound => 'Nenhuma partida encontrada';

  @override
  String get playAGameToSeeHistory => 'Jogue uma partida para ver o histórico.';

  @override
  String get winner => 'VENCEDOR';

  @override
  String get tie => 'EMPATE';

  @override
  String get playAgain => 'Jogar Novamente';

  @override
  String playAs(String playerMark) {
    return 'Jogar como $playerMark';
  }

  @override
  String get gameSavedSuccessfully => 'Jogo salvo com sucesso';

  @override
  String get settings => 'Configurações';

  @override
  String get language => 'Idioma';

  @override
  String get theme => 'Tema';

  @override
  String get sound => 'Som';

  @override
  String get themeSelectionPlaceholder => 'Selecionar tema';

  @override
  String get soundSettingsPlaceholder => 'Selecionar som';
}
