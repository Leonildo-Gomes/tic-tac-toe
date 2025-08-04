// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Norwegian Bokmål (`nb`).
class AppLocalizationsNb extends AppLocalizations {
  AppLocalizationsNb([String locale = 'nb']) : super(locale);

  @override
  String get appTitle => 'Tic Tac Toe';

  @override
  String get challengeYourself => 'Utfordre deg selv!';

  @override
  String get startGame => 'Start spill';

  @override
  String get history => 'Historikk';

  @override
  String get game => 'Spill';

  @override
  String get restartGame => 'Start på nytt';

  @override
  String get drawMessage => 'Uavgjort!';

  @override
  String get you => 'Du';

  @override
  String get cpu => 'CPU';

  @override
  String get newGame => 'Nytt spill';

  @override
  String get gameLevel => 'Spillnivå';

  @override
  String get chooseYourSide => 'Velg din side';

  @override
  String get difficultyEasy => 'Enkel';

  @override
  String get difficultyMedium => 'Middels';

  @override
  String get difficultyHard => 'Vanskelig';

  @override
  String winnerMessage(String playerName) {
    return 'Vinneren er $playerName!';
  }

  @override
  String scoreWins(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Seire',
      one: '1 Seier',
    );
    return '$_temp0';
  }

  @override
  String get historyGame => 'Spillhistorikk';

  @override
  String get clearAllHistory => 'Slett all historikk';

  @override
  String get historyCleared => 'Historikken er slettet!';

  @override
  String get matchDeleted => 'Kamp slettet.';

  @override
  String get undo => 'ANGRE';

  @override
  String get confirmExclusion => 'Bekreft sletting';

  @override
  String get confirmClearHistory =>
      'Er du sikker på at du vil slette all spillhistorikk? Handlingen kan ikke angres.';

  @override
  String get cancel => 'Avbryt';

  @override
  String get clear => 'Slett';

  @override
  String get playerYou => 'Du';

  @override
  String get playerCPU => 'CPU';

  @override
  String get draw => 'Uavgjort';

  @override
  String get level => 'Nivå';

  @override
  String winnerIs(String playerName) {
    return 'Vinner: $playerName';
  }

  @override
  String get noMatchesFound => 'Ingen kamper funnet';

  @override
  String get playAGameToSeeHistory => 'Spill et spill for å se historikk.';

  @override
  String get winner => 'VINNER';

  @override
  String get tie => 'UAVGJORT';

  @override
  String get playAgain => 'Spill igjen';

  @override
  String playAs(String playerMark) {
    return 'Spill som $playerMark';
  }

  @override
  String get gameSavedSuccessfully => 'Spill lagret vellykket';

  @override
  String get settings => 'Innstillinger';

  @override
  String get language => 'Språk';

  @override
  String get theme => 'Tema';

  @override
  String get sound => 'Lyd';

  @override
  String get themeSelectionPlaceholder => 'Velg tema';

  @override
  String get soundSettingsPlaceholder => 'Velg lyd';
}
