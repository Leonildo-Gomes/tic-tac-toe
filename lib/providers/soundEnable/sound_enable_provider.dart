import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String _soundEnabledKey = 'sound_enabled';

/// Provider for managing the sound setting state.
///
/// It provides a boolean value indicating whether the sound is enabled or not.
/// It also handles loading and saving the setting to SharedPreferences.
final soundEnabledProvider = StateNotifierProvider<SoundEnabledNotifier, bool>((ref) {
  return SoundEnabledNotifier();
});

class SoundEnabledNotifier extends StateNotifier<bool> {
  SoundEnabledNotifier() : super(true) { // Default to sound enabled
    _loadSetting();
  }

  SharedPreferences? _prefs;

  /// Loads the sound setting from SharedPreferences.
  Future<void> _loadSetting() async {
    _prefs = await SharedPreferences.getInstance();
    state = _prefs?.getBool(_soundEnabledKey) ?? true; // Default to true if not set
  }

  /// Toggles the sound setting and saves the new value.
  Future<void> toggle() async {
    state = !state;
    _prefs = await SharedPreferences.getInstance();
    await _prefs?.setBool(_soundEnabledKey, state);
  }
}