import 'package:flutter/widgets.dart';
import 'package:tic_tac_toe/l10n/app_localizations.dart';

extension AppLocalizationsX on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this)!;
}
