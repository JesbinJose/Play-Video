import 'package:flutter/material.dart';
import 'package:play_video/models/controls.dart';

class HideMoreButton extends StatelessWidget {
  const HideMoreButton({
    super.key,
    required this.state,
    this.theme,
    this.widget,
  });

  final VideoPlayerState state;
  final PlayerTheme? theme;
  final Widget? widget;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => state.moreOpacityNotifier.value = 0,
      icon: widget ??
          Icon(
            Icons.arrow_back_ios_new_rounded,
            size: theme?.iconsSize,
            color: theme?.iconsColor,
          ),
    );
  }
}
