import 'package:flutter/material.dart';
import 'package:play_video/models/state.dart';
import 'package:play_video/models/theme.dart';

class LockScreenButton extends StatelessWidget {
  const LockScreenButton({
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
      onPressed: () => state.lockNotifier.value = true,
      icon: child ??
          Icon(
            Icons.lock,
            size: theme?.iconsSize,
            color: theme?.iconsColor,
          ),
    );
  }
}
