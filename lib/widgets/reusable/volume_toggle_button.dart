
import 'package:flutter/material.dart';
import 'package:play_video/models/state.dart';

class DefaultMuteToggleButton extends StatelessWidget {
  const DefaultMuteToggleButton({
    super.key,
    required this.state,
  });

  final VideoPlayerState state;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable:
          state.volume.muteNotifier,
      builder: (_, value, __) {
        return IconButton(
          onPressed: () =>
              state.volume.toggleMute(),
          icon: Icon(
            value
                ? Icons.volume_off
                : Icons.volume_up,
          ),
        );
      },
    );
  }
}
