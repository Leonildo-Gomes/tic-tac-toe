import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String _soundKey = 'sound_enabled';

final soundProvider = StateNotifierProvider<SoundNotifier, bool>((ref) {
  return SoundNotifier();
});

class SoundNotifier extends StateNotifier<bool> {
  SoundNotifier() : super(true) { // Default to sound on
    _loadSoundSetting();
  }

  Future<void> _loadSoundSetting() async {
    final prefs = await SharedPreferences.getInstance();
    state = prefs.getBool(_soundKey) ?? true; // Default to true if not set
  }

  Future<void> setSound(bool isEnabled) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_soundKey, isEnabled);
    state = isEnabled;
  }
}
