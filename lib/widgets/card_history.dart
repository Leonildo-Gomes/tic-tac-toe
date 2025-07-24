import 'package:flutter/material.dart';
import 'package:tic_tac_toe/core/constants/player.dart';

/// A redesigned, visually enhanced card to display a summary of a past game.
///
/// As a design expert, I've revamped this widget to be more intuitive and
/// aesthetically pleasing. Key improvements include:
/// - A colored accent border that immediately signals the game's outcome.
/// - Improved visual hierarchy, making the winner the focal point.
/// - Better-organized metadata with icons for scannability.
/// - Refined spacing and layout for a cleaner, more modern look.
class CardHistory extends StatelessWidget {
  final String winner;
  final String date;
  final String mode;
  final List<String> board;
  final String level;

  const CardHistory({
    super.key,
    required this.winner,
    required this.date,
    required this.mode,
    required this.board,
    required this.level,
  });

  // Using static const for layout values improves readability and maintainability.
  static const _kHorizontalSpacing = 16.0;
  static const _kMiniBoardSize = 60.0;
  static const _kAccentBorderWidth = 4.0;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDraw = winner.toLowerCase() == 'empate';

    final Color accentColor;
    if (isDraw) {
      accentColor = colorScheme.onSurfaceVariant;
    } else if (winner == Player.playerX) {
      accentColor = colorScheme.primary;
    } else {
      accentColor = colorScheme.tertiary;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHigh,
        borderRadius: BorderRadius.circular(16),
        border: Border(
          left: BorderSide(color: accentColor, width: _kAccentBorderWidth),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(child: _buildGameInfo(context, accentColor, isDraw)),
          const SizedBox(width: _kHorizontalSpacing),
          _buildMiniBoard(context, colorScheme),
        ],
      ),
    );
  }

  /// Builds the main information section of the card.
  Widget _buildGameInfo(BuildContext context, Color accentColor, bool isDraw) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildWinnerDisplay(context, accentColor, isDraw),
        const SizedBox(height: 8),
        _buildMetadataRow(
          context,
          icon: mode == 'CPU' ? Icons.computer_outlined : Icons.person_outline,
          text: 'Nível $level',
        ),
        const SizedBox(height: 4),
        _buildMetadataRow(
          context,
          icon: Icons.calendar_today_outlined,
          text: date,
        ),
      ],
    );
  }

  /// Builds the primary display for the winner or draw status.
  Widget _buildWinnerDisplay(
    BuildContext context,
    Color accentColor,
    bool isDraw,
  ) {
    final textTheme = Theme.of(context).textTheme;
    final title = isDraw ? 'Empate' : 'Vencedor: $winner';

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          isDraw ? Icons.handshake_outlined : Icons.emoji_events_outlined,
          color: accentColor,
          size: 24,
        ),
        const SizedBox(width: 8),
        Text(
          title,
          style: textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: accentColor,
          ),
        ),
      ],
    );
  }

  /// Builds a row for metadata, containing an icon and text.
  Widget _buildMetadataRow(
    BuildContext context, {
    required IconData icon,
    required String text,
  }) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      children: [
        Icon(icon, size: 14, color: colorScheme.onSurfaceVariant),
        const SizedBox(width: 8),
        Text(
          text,
          style: textTheme.bodySmall?.copyWith(
            color: colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }

  /// Builds the 3x3 mini-board showing the final state of the game.
  Widget _buildMiniBoard(BuildContext context, ColorScheme colorScheme) {
    return SizedBox(
      width: _kMiniBoardSize,
      height: _kMiniBoardSize,
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 2,
          crossAxisSpacing: 2,
        ),
        itemCount: board.length,
        itemBuilder: (context, index) {
          final mark = board[index];
          final Color markColor;

          if (mark == Player.playerX) {
            markColor = colorScheme.primary;
          } else if (mark == Player.playerO) {
            markColor = colorScheme.tertiary;
          } else {
            markColor = Colors.transparent;
          }

          return Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: colorScheme.surfaceContainer,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              mark,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: markColor,
              ),
            ),
          );
        },
      ),
    );
  }
}
