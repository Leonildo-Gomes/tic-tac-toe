import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tic_tac_toe/core/utils/context_extensions.dart';

class SoundSetting extends ConsumerStatefulWidget {
  const SoundSetting({super.key});

  @override
  ConsumerState<SoundSetting> createState() => _SoundSettingState();
}

class _SoundSettingState extends ConsumerState<SoundSetting> {
  bool _soundEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      clipBehavior: Clip.antiAlias,
      child: SwitchListTile(
        title: Text(context.l10n.soundEffects),
        subtitle: Text(context.l10n.soundEffectsDescription),
        secondary: const Icon(Icons.volume_up_rounded),
        value: _soundEnabled,
        onChanged: (bool value) {
          setState(() {
            _soundEnabled = value;
          });
        },
      ),
    );
  }
}
