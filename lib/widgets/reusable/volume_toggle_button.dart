import 'package:flutter/material.dart';
import 'package:play_video/models/state.dart';

class DefaultMuteToggleButton extends StatelessWidget {
  const DefaultMuteToggleButton({
    super.key,
    required this.state,
    this.muteWidget,
    this.unMuteWidget,
  });

  final VideoPlayerState state;
  final Widget? muteWidget;
  final Widget? unMuteWidget;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: state.volume.muteNotifier,
      builder: (_, value, __) {
        return IconButton(
          onPressed: () => state.volume.toggleMute(),
          icon: value
              ? muteWidget ?? const Icon(Icons.volume_off)
              : unMuteWidget ?? const Icon(Icons.volume_up),
        );
      },
    );
  }
}
