import 'package:audioplayers/audioplayers.dart';

/// A service class to handle all audio playback logic.
/// It encapsulates the AudioPlayer and provides simple methods to play
/// specific game sounds.
class SoundService {
  SoundService(this._player);

  final AudioPlayer _player;

  /// Plays the sound for a player's move.
  Future<void> playClickSound() async {
    await _playSound('sounds/write.mp3');
  }

  /// Plays the sound for winning the game.
  Future<void> playWinSound() async {
    await _playSound('sounds/winner.mp3');
  }

  /// Plays the sound for losing the game.
  Future<void> playLoseSound() async {
    await _playSound('sounds/lose.mp3');
  }

  /// Plays the sound for a draw game.
  Future<void> playDrawSound() async {
    await _playSound('sounds/draw.mp3');
  }

  /// A private helper method to play a sound from an asset.
  /// It handles potential errors and ensures the player stops before playing
  /// a new sound to avoid overlaps.
  Future<void> _playSound(String assetPath) async {
    try {
      // Stop any currently playing sound before starting a new one.
      await _player.stop();
      await _player.play(AssetSource(assetPath));
    } catch (e) {
      // Log errors to the console for debugging.
      print('Error playing sound: $e');
    }
  }

  /// Releases the resources used by the AudioPlayer.
  /// This is important to prevent memory leaks.
  void dispose() {
    _player.dispose();
  }
}