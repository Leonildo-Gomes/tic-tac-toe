import 'package:flutter/material.dart';

/// A widget that provides a radio button for player mark selection (X or O).
///
/// This widget is designed to be used within a [StatefulWidget] that manages
/// the state of the selected mark.
class PlayerChoice extends StatelessWidget {
  /// The mark represented by this radio button (e.g., 'X' or 'O').
  final String value;

  /// The currently selected mark in the group of radio buttons.
  final String groupValue;

  /// The callback that is executed when this radio button is selected.
  final ValueChanged<String?> onChanged;

  /// Creates a [PlayerChoice] widget.
  const PlayerChoice({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return RadioListTile<String>(
      title: Text('Play asagor $value'),
      value: value,
      groupValue: groupValue,
      onChanged: onChanged,
      activeColor: Theme.of(context).colorScheme.primary,
    );
  }
}
