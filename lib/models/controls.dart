import 'package:flutter/material.dart';
import 'package:play_video/models/state.dart';
import 'package:play_video/models/theme.dart';
import 'package:play_video/widgets/overlay/overlay.dart';

class OverlayControls {
  Widget Function(VideoPlayerState)? overlay;
  final PlayerTheme theme;
  OverlayControls.deFault({
    this.theme = const PlayerTheme(),
  }) {
    overlay = (state) {
      return OverlayPlayer(state: state, theme: theme);
    };
  }
  OverlayControls.custom({
    required this.overlay,
    required this.theme,
  });
}
