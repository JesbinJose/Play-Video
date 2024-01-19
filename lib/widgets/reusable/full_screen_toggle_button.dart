import 'package:flutter/material.dart';
import 'package:play_video/models/state.dart';

class EnterExitFullScreenButton extends StatelessWidget {
  EnterExitFullScreenButton({
    super.key,
    required this.state,
    this.fullScreen,
    this.exitFullScreen,
  });

  final VideoPlayerState state;
  final Widget? fullScreen;
  final Widget? exitFullScreen;
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
              ? exitFullScreen ?? const Icon(Icons.fullscreen_exit)
              : fullScreen ?? const Icon(Icons.fullscreen),
        );
      },
    );
  }
}
