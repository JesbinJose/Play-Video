import 'package:flutter/material.dart';
import 'package:play_video/models/state.dart';
import 'package:play_video/models/theme.dart';

class PreviousButton extends StatelessWidget {
  const PreviousButton({
    super.key,
    required this.state,
    this.child,
    this.theme,
  });

  final VideoPlayerState state;
  final Widget? child;

  final PlayerTheme? theme;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => state.previous(),
      icon: child ??
          Icon(
            Icons.skip_previous_rounded,
            size: theme?.iconsSize,
            color: theme?.iconsColor,
          ),
    );
  }
}
