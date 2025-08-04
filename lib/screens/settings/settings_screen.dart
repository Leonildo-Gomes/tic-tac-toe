import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tic_tac_toe/core/enums/language.dart';
import 'package:tic_tac_toe/core/utils/context_extensions.dart';
import 'package:tic_tac_toe/l10n/app_localizations.dart';
import 'package:tic_tac_toe/providers/locale/locale_provider.dart';

class SettingsScreen extends ConsumerStatefulWidget {
  static const String routeName = 'SettingsScreen';
  const SettingsScreen({super.key});

  @override
  ConsumerState<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final selectedLocale = ref.watch(localeProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.settings),
        backgroundColor: theme.colorScheme.surfaceContainerLow,
        scrolledUnderElevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(context.l10n.language, style: theme.textTheme.titleMedium),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 12.0,
                vertical: 4.0,
              ),
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
                          Text(
                            language.flag,
                            style: const TextStyle(fontSize: 24),
                          ),
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
            ),
            const SizedBox(height: 24),
            Text(context.l10n.theme, style: theme.textTheme.titleMedium),
            const SizedBox(height: 8),
            // Placeholder for Theme selection
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: theme.colorScheme.outline),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(context.l10n.themeSelectionPlaceholder),
            ),
            const SizedBox(height: 24),
            Text(context.l10n.sound, style: theme.textTheme.titleMedium),
            const SizedBox(height: 8),
            // Placeholder for Sound settings
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: theme.colorScheme.outline),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(context.l10n.soundSettingsPlaceholder),
            ),
          ],
        ),
      ),
    );
  }
}
