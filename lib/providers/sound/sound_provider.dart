import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tic_tac_toe/services/sound/sound_service.dart';

const String _soundEnabledKey = 'sound_enabled';

// --- Service Provider ---

/// Provider to make the SoundService available to the rest of the app.
final soundServiceProvider = Provider<SoundService>((ref) {
  final player = AudioPlayer();
  final service = SoundService(player);

  // Dispose the player when the provider is destroyed.
  ref.onDispose(() => service.dispose());

  return service;
});

// --- State Notifier Provider for Sound Setting ---

/// Provider for managing the sound setting state (enabled/disabled).
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