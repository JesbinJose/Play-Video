import 'package:flutter/material.dart';
import 'package:play_video/models/state.dart';
import 'package:play_video/models/theme.dart';

class MoreButton extends StatelessWidget {
  const MoreButton({
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
      onPressed: () {
        state.overlayOpacityNotifier.value = 0;
        state.moreOpacityNotifier.value = 1;
      },
      icon: child ??
          Icon(
            Icons.more_horiz,
            size: theme?.iconsSize,
            color: theme?.iconsColor,
          ),
    );
  }
}
