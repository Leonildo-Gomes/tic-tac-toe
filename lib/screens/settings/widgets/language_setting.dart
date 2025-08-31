import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tic_tac_toe/core/enums/language.dart';
import 'package:tic_tac_toe/l10n/app_localizations.dart';
import 'package:tic_tac_toe/providers/locale/locale_provider.dart';

class LanguageSetting extends ConsumerWidget {
  const LanguageSetting({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final selectedLocale = ref.watch(localeProvider);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: theme.colorScheme.outlineVariant),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<Locale>(
          isExpanded: true,
          value: selectedLocale,
          icon: Icon(
            Icons.arrow_drop_down,
            color: theme.colorScheme.onSurfaceVariant,
          ),
          onChanged: (Locale? newLocale) {
            if (newLocale != null) {
              ref.read(localeProvider.notifier).setLocale(newLocale);
            }
          },
          items: AppLocalizations.supportedLocales.map((Locale locale) {
            final language = Language.fromCode(locale.languageCode);
            final isSelected = selectedLocale == locale;
            return DropdownMenuItem<Locale>(
              value: locale,
              child: Row(
                children: [
                  Text(language.flag, style: const TextStyle(fontSize: 24)),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      language.name,
                      style: theme.textTheme.bodyLarge,
                    ),
                  ),
                  if (isSelected)
                    Icon(
                      Icons.check_circle_outline_rounded,
                      color: theme.colorScheme.primary,
                    ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
