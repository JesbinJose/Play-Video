
import 'package:flutter/material.dart';
import 'package:play_video/models/state.dart';

class EnterExitFullScreenButton extends StatelessWidget {
  EnterExitFullScreenButton({
    super.key,
    required this.state,
  });

  final VideoPlayerState state;
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
          icon: Icon(
            v ? Icons.fullscreen_exit : Icons.fullscreen,
          ),
        );
      },
    );
  }
}