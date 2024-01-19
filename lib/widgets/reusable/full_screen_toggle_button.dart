import 'package:flutter/material.dart';
import 'package:play_video/models/state.dart';
import 'package:play_video/models/theme.dart';

class EnterExitFullScreenButton extends StatelessWidget {
  EnterExitFullScreenButton({
    super.key,
    required this.state,
    this.fullScreen,
    this.exitFullScreen,
    this.theme,
  });

  final VideoPlayerState state;
  final Widget? fullScreen;
  final Widget? exitFullScreen;
  final PlayerTheme? theme;
  final ValueNotifier<bool> _isInFullScreen = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _isInFullScreen,
      builder: (_, v, __) {
        return IconButton(
          onPressed: () {
            state.toggleFullScreen();
            _isInFullScreen.value = !v;
          },
          icon: v
              ? exitFullScreen ??
                  Icon(
                    Icons.fullscreen_exit,
                    size: theme?.iconsSize,
                    color: theme?.iconsColor,
                  )
              : fullScreen ??
                  Icon(
                    Icons.fullscreen,
                    size: theme?.iconsSize,
                    color: theme?.iconsColor,
                  ),
        );
      },
    );
  }
}
