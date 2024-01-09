import 'package:flutter/material.dart';
import 'package:play_video/widgets/overlay/overlay.dart';

class OverlayControls {
  late Widget overlay;
  OverlayControls.none() {
    overlay = const SizedBox.shrink();
  }
  OverlayControls.deFault() {
    overlay = OverlayPlayer();
  }
  OverlayControls.custom() {
    overlay = OverlayPlayer();
  }
}
