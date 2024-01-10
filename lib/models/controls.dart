import 'package:flutter/material.dart';
import 'package:play_video/models/theme.dart';
import 'package:play_video/widgets/overlay/overlay.dart';

class OverlayControls {
  final Widget overlay;
  final PlayerTheme theme;
  const OverlayControls.deFault({
    this.overlay = const OverlayPlayer(),
    this.theme = const PlayerTheme(),
  });
  const OverlayControls.custom({
    required this.overlay,
    required this.theme,
  });
}
