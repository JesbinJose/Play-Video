import 'package:flutter/material.dart';
import 'package:play_video/models/state.dart';
import 'package:play_video/models/theme.dart';
import 'package:play_video/widgets/overlay/overlay.dart';

/// [OverlayControls] is the class which deside which 
/// Video player controls and there theme 
/// 
class OverlayControls {
  Widget Function(VideoPlayerState)? overlay;
  late PlayerTheme theme;
  /// [OverlayControls.none] Using it there won't be any ui.
  /// Also the the ui based controls can throw error
  OverlayControls.none() {
    overlay = (p0) => const SizedBox.shrink();
    theme = const PlayerTheme();
  }
  /// [OverlayControls.deFault] The Ui is the default ui provided in the package.
  /// 
  /// You can use all the contols and theme customization use theme argument 
  /// 
  /// [PlayerTheme] can be used for custom theme
  OverlayControls.deFault({
    this.theme = const PlayerTheme(),
  }) {
    overlay = (state) {
      return OverlayPlayer(state: state, theme: theme);
    };
  }
  /// [OverlayControls.custom] The Full ui and other things are in you control
  ///
  /// [overlay] takes Widget Function(VideoPlayerState)
  /// 
  /// [Widget] is Where you need to return the contorl/Ui as a Widget in this function 
  ///  
  /// [VideoPlayerState] Is the part that provide all the funcionality
  OverlayControls.custom({
    required this.overlay,
    required this.theme,
  });
}
