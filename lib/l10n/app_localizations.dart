import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_nb.dart';
import 'app_localizations_pt.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('nb'),
    Locale('pt'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Tic Tac Toe'**
  String get appTitle;

  /// No description provided for @challengeYourself.
  ///
  /// In en, this message translates to:
  /// **'Challenge yourself!'**
  String get challengeYourself;

  /// No description provided for @startGame.
  ///
  /// In en, this message translates to:
  /// **'Start Game'**
  String get startGame;

  /// No description provided for @history.
  ///
  /// In en, this message translates to:
  /// **'History'**
  String get history;

  /// No description provided for @game.
  ///
  /// In en, this message translates to:
  /// **'Game'**
  String get game;

  /// No description provided for @restartGame.
  ///
  /// In en, this message translates to:
  /// **'Restart Game'**
  String get restartGame;

  /// No description provided for @drawMessage.
  ///
  /// In en, this message translates to:
  /// **'It\'s a Draw!'**
  String get drawMessage;

  /// No description provided for @you.
  ///
  /// In en, this message translates to:
  /// **'You'**
  String get you;

  /// No description provided for @cpu.
  ///
  /// In en, this message translates to:
  /// **'CPU'**
  String get cpu;

  /// No description provided for @newGame.
  ///
  /// In en, this message translates to:
  /// **'New Game'**
  String get newGame;

  /// No description provided for @gameLevel.
  ///
  /// In en, this message translates to:
  /// **'Game Level'**
  String get gameLevel;

  /// No description provided for @chooseYourSide.
  ///
  /// In en, this message translates to:
  /// **'Choose your side'**
  String get chooseYourSide;

  /// No description provided for @difficultyEasy.
  ///
  /// In en, this message translates to:
  /// **'Easy'**
  String get difficultyEasy;

  /// No description provided for @difficultyMedium.
  ///
  /// In en, this message translates to:
  /// **'Medium'**
  String get difficultyMedium;

  /// No description provided for @difficultyHard.
  ///
  /// In en, this message translates to:
  /// **'Hard'**
  String get difficultyHard;

  /// The message shown when a player wins.
  ///
  /// In en, this message translates to:
  /// **'The winner is {playerName}!'**
  String winnerMessage(String playerName);

  /// Text to display the number of wins.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, one{1 Win} other{{count} Wins}}'**
  String scoreWins(int count);

  /// No description provided for @historyGame.
  ///
  /// In en, this message translates to:
  /// **'Game History'**
  String get historyGame;

  /// No description provided for @clearAllHistory.
  ///
  /// In en, this message translates to:
  /// **'Clear all history'**
  String get clearAllHistory;

  /// No description provided for @historyCleared.
  ///
  /// In en, this message translates to:
  /// **'History cleared successfully!'**
  String get historyCleared;

  /// No description provided for @matchDeleted.
  ///
  /// In en, this message translates to:
  /// **'Match deleted.'**
  String get matchDeleted;

  /// No description provided for @undo.
  ///
  /// In en, this message translates to:
  /// **'UNDO'**
  String get undo;

  /// No description provided for @confirmExclusion.
  ///
  /// In en, this message translates to:
  /// **'Confirm Deletion'**
  String get confirmExclusion;

  /// No description provided for @confirmClearHistory.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete all game history? This action cannot be undone.'**
  String get confirmClearHistory;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @clear.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get clear;

  /// No description provided for @playerYou.
  ///
  /// In en, this message translates to:
  /// **'You'**
  String get playerYou;

  /// No description provided for @playerCPU.
  ///
  /// In en, this message translates to:
  /// **'CPU'**
  String get playerCPU;

  /// No description provided for @draw.
  ///
  /// In en, this message translates to:
  /// **'Draw'**
  String get draw;

  /// No description provided for @level.
  ///
  /// In en, this message translates to:
  /// **'Level'**
  String get level;

  /// Message indicating the winner.
  ///
  /// In en, this message translates to:
  /// **'Winner: {playerName}'**
  String winnerIs(String playerName);

  /// No description provided for @noMatchesFound.
  ///
  /// In en, this message translates to:
  /// **'No matches found'**
  String get noMatchesFound;

  /// No description provided for @playAGameToSeeHistory.
  ///
  /// In en, this message translates to:
  /// **'Play a game to see history.'**
  String get playAGameToSeeHistory;

  /// No description provided for @winner.
  ///
  /// In en, this message translates to:
  /// **'WINNER'**
  String get winner;

  /// No description provided for @tie.
  ///
  /// In en, this message translates to:
  /// **'TIE'**
  String get tie;

  /// No description provided for @playAgain.
  ///
  /// In en, this message translates to:
  /// **'Play Again'**
  String get playAgain;

  /// Message for playing as a specific mark.
  ///
  /// In en, this message translates to:
  /// **'Play as {playerMark}'**
  String playAs(String playerMark);

  /// No description provided for @gameSavedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Game saved successfully'**
  String get gameSavedSuccessfully;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @theme.
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get theme;

  /// No description provided for @sound.
  ///
  /// In en, this message translates to:
  /// **'Sound'**
  String get sound;

  /// No description provided for @themeSelectionPlaceholder.
  ///
  /// In en, this message translates to:
  /// **'Select theme'**
  String get themeSelectionPlaceholder;

  /// No description provided for @soundSettingsPlaceholder.
  ///
  /// In en, this message translates to:
  /// **'Select sound'**
  String get soundSettingsPlaceholder;

  /// No description provided for @themeLight.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get themeLight;

  /// No description provided for @themeDark.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get themeDark;

  /// No description provided for @themeSystem.
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get themeSystem;

  /// No description provided for @soundEffects.
  ///
  /// In en, this message translates to:
  /// **'Sound Effects'**
  String get soundEffects;

  /// No description provided for @soundEffectsDescription.
  ///
  /// In en, this message translates to:
  /// **'Enable or disable game sound effects'**
  String get soundEffectsDescription;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'nb', 'pt'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'nb':
      return AppLocalizationsNb();
    case 'pt':
      return AppLocalizationsPt();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
