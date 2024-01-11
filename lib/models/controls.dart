import 'package:flutter/material.dart';
import 'package:media_kit_video/media_kit_video.dart';
import 'package:play_video/models/theme.dart';

class OverlayControls {
  final Widget? Function(VideoState)? overlay;
  final PlayerTheme theme;
  const OverlayControls.deFault({
    this.overlay,
    this.theme = const PlayerTheme(),
  });
  const OverlayControls.custom({
    required this.overlay,
    required this.theme,
  });
}
