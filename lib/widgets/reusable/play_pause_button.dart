import 'package:flutter/material.dart';
import 'package:play_video/models/state.dart';

class PlayPauseButton extends StatelessWidget {
  const PlayPauseButton({
    super.key,
    required this.state,
    this.playIcon = const Icon(Icons.play_arrow_rounded),
    this.pauseIcon = const Icon(Icons.pause_rounded),
  });

  final VideoPlayerState state;
  final Widget playIcon;
  final Widget pauseIcon;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        state.playOrPause();
        print(state.state.position);
        state.seek(
          state.state.position + const Duration(seconds: 10),
        );
        print(state.state.position);
      },
      icon: ValueListenableBuilder<bool>(
        valueListenable: state.isPlaying,
        builder: (_, v, __) {
          return v ? pauseIcon : playIcon;
        },
      ),
    );
  }
}
