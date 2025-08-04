import 'package:flutter/material.dart';
import 'package:tic_tac_toe/core/utils/context_extensions.dart';
import 'package:tic_tac_toe/screens/settings/widgets/language_setting.dart';
import 'package:tic_tac_toe/screens/settings/widgets/sound_setting.dart';
import 'package:tic_tac_toe/screens/settings/widgets/theme_setting.dart';

class SettingsScreen extends StatelessWidget {
  static const String routeName = 'SettingsScreen';
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

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
          children: [
            _SettingsSection(
              title: context.l10n.language,
              child: const LanguageSetting(),
            ),
            _SettingsSection(
              title: context.l10n.theme,
              child: const ThemeSetting(),
            ),
            _SettingsSection(
              title: context.l10n.sound,
              child: const SoundSetting(),
            ),
          ],
        ),
      ),
    );
  }
}

class _SettingsSection extends StatelessWidget {
  const _SettingsSection({required this.title, required this.child});

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: theme.textTheme.titleMedium),
        const SizedBox(height: 8),
        child,
        const SizedBox(height: 24),
      ],
    );
  }
}
