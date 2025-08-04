import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tic_tac_toe/core/enums/app_theme_mode.dart';
import 'package:tic_tac_toe/core/utils/context_extensions.dart';
import 'package:tic_tac_toe/providers/theme/theme_provider.dart';

class ThemeSetting extends ConsumerWidget {
  const ThemeSetting({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SegmentedButton<AppThemeMode>(
      segments: <ButtonSegment<AppThemeMode>>[
        ButtonSegment<AppThemeMode>(
          value: AppThemeMode.light,
          label: Text(context.l10n.themeLight),
          icon: const Icon(Icons.light_mode),
        ),
        ButtonSegment<AppThemeMode>(
          value: AppThemeMode.dark,
          label: Text(context.l10n.themeDark),
          icon: const Icon(Icons.dark_mode),
        ),
        ButtonSegment<AppThemeMode>(
          value: AppThemeMode.system,
          label: Text(context.l10n.themeSystem),
          icon: const Icon(Icons.brightness_auto),
        ),
      ],
      selected: {ref.watch(themeProvider)},
      onSelectionChanged: (Set<AppThemeMode> newSelection) {
        ref.read(themeProvider.notifier).setTheme(newSelection.first);
      },
    );
  }
}
