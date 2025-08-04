// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Tic Tac Toe';

  @override
  String get challengeYourself => 'Challenge yourself!';

  @override
  String get startGame => 'Start Game';

  @override
  String get history => 'History';

  @override
  String get game => 'Game';

  @override
  String get restartGame => 'Restart Game';

  @override
  String get drawMessage => 'It\'s a Draw!';

  @override
  String get you => 'You';

  @override
  String get cpu => 'CPU';

  @override
  String get newGame => 'New Game';

  @override
  String get gameLevel => 'Game Level';

  @override
  String get chooseYourSide => 'Choose your side';

  @override
  String get difficultyEasy => 'Easy';

  @override
  String get difficultyMedium => 'Medium';

  @override
  String get difficultyHard => 'Hard';

  @override
  String winnerMessage(String playerName) {
    return 'The winner is $playerName!';
  }

  @override
  String scoreWins(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Wins',
      one: '1 Win',
    );
    return '$_temp0';
  }

  @override
  String get historyGame => 'Game History';

  @override
  String get clearAllHistory => 'Clear all history';

  @override
  String get historyCleared => 'History cleared successfully!';

  @override
  String get matchDeleted => 'Match deleted.';

  @override
  String get undo => 'UNDO';

  @override
  String get confirmExclusion => 'Confirm Deletion';

  @override
  String get confirmClearHistory =>
      'Are you sure you want to delete all game history? This action cannot be undone.';

  @override
  String get cancel => 'Cancel';

  @override
  String get clear => 'Delete';

  @override
  String get playerYou => 'You';

  @override
  String get playerCPU => 'CPU';

  @override
  String get draw => 'Draw';

  @override
  String get level => 'Level';

  @override
  String winnerIs(String playerName) {
    return 'Winner: $playerName';
  }

  @override
  String get noMatchesFound => 'No matches found';

  @override
  String get playAGameToSeeHistory => 'Play a game to see history.';

  @override
  String get winner => 'WINNER';

  @override
  String get tie => 'TIE';

  @override
  String get playAgain => 'Play Again';

  @override
  String playAs(String playerMark) {
    return 'Play as $playerMark';
  }

  @override
  String get gameSavedSuccessfully => 'Game saved successfully';

  @override
  String get settings => 'Settings';

  @override
  String get language => 'Language';

  @override
  String get theme => 'Theme';

  @override
  String get sound => 'Sound';

  @override
  String get themeSelectionPlaceholder => 'Select theme';

  @override
  String get soundSettingsPlaceholder => 'Select sound';

  @override
  String get themeLight => 'Light';

  @override
  String get themeDark => 'Dark';

  @override
  String get themeSystem => 'System';

  @override
  String get soundEffects => 'Sound Effects';

  @override
  String get soundEffectsDescription => 'Enable or disable game sound effects';
}
