import 'package:flutter/material.dart';
import 'package:play_video/models/state.dart';
import 'package:play_video/models/theme.dart';

class DefaultMuteToggleButton extends StatelessWidget {
  const DefaultMuteToggleButton({
    super.key,
    required this.state,
    this.muteWidget,
    this.unMuteWidget,
    this.theme,
  });

  final VideoPlayerState state;
  final Widget? muteWidget;
  final Widget? unMuteWidget;
  final PlayerTheme? theme;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: state.volume.muteNotifier,
      builder: (_, value, __) {
        return IconButton(
          onPressed: () => state.volume.toggleMute(),
          icon: value
              ? muteWidget ??
                  Icon(
                    Icons.volume_off,
                    size: theme?.iconsSize,
                    color: theme?.iconsColor,
                  )
              : unMuteWidget ??
                  Icon(
                    Icons.volume_up,
                    size: theme?.iconsSize,
                    color: theme?.iconsColor,
                  ),
        );
      },
    );
  }
}
