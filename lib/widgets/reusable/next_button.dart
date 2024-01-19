import 'package:flutter/material.dart';
import 'package:play_video/models/state.dart';
import 'package:play_video/models/theme.dart';

class NextButton extends StatelessWidget {
  const NextButton({
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
      onPressed: () => state.next(),
      icon: child ??
          Icon(
            Icons.skip_next_rounded,
            size: theme?.iconsSize,
            color: theme?.iconsColor,
          ),
    );
  }
}
