import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tic_tac_toe/core/utils/context_extensions.dart';
import 'package:tic_tac_toe/providers/sound/sound_provider.dart';

class SoundSetting extends ConsumerWidget {
  const SoundSetting({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the provider to get the current state and rebuild on change.
    final isSoundEnabled = ref.watch(soundEnabledProvider);

    return Card(
      margin: EdgeInsets.zero,
      clipBehavior: Clip.antiAlias,
      child: SwitchListTile(
        title: Text(context.l10n.soundEffects),
        subtitle: Text(context.l10n.soundEffectsDescription),
        secondary: isSoundEnabled
            ? const Icon(Icons.volume_up)
            : const Icon(Icons.volume_off),
        value: isSoundEnabled,
        // Call the notifier to toggle the state and persist the change.
        onChanged: (_) => ref.read(soundEnabledProvider.notifier).toggle(),
      ),
    );
  }
}
