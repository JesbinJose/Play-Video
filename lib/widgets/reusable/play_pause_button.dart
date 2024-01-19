import 'package:flutter/material.dart';
import 'package:play_video/models/state.dart';
import 'package:play_video/models/theme.dart';

class PlayPauseButton extends StatelessWidget {
  const PlayPauseButton({
    super.key,
    required this.state,
    this.playIcon,
    this.pauseIcon,
    this.theme,
  });

  final VideoPlayerState state;
  final Widget? playIcon;
  final Widget? pauseIcon;
  final PlayerTheme? theme;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => state.playOrPause(),
      icon: ValueListenableBuilder<bool>(
        valueListenable: state.isPlay,
        builder: (_, v, __) {
          return v
              ? pauseIcon ??
                  Icon(
                    Icons.pause_rounded,
                    size: theme?.iconsSize,
                    color: theme?.iconsColor,
                  )
              : playIcon ??
                  Icon(
                    Icons.play_arrow_rounded,
                    size: theme?.iconsSize,
                    color: theme?.iconsColor,
                  );
        },
      ),
    );
  }
}
