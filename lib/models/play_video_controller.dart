import 'package:flutter/material.dart';
import 'package:play_video/models/state.dart';
import 'package:play_video/models/videos.dart';

export 'videos.dart';
export 'state.dart';

/// [PlayVideoController] is the controller passed in the VideoPlayer widget
/// It Contain common functionality and my differs according to the input
///
/// To access the state that contain all funtionality
/// It must be given as a controller in the [PlayVideo]
class PlayVideoController {
  /// [videos] Add all Videos As [Videos]
  final Videos videos;
  final double? aspectRatio;

  /// [isAutoPlay] desides start video auto or manualy
  final bool isAutoPlay;

  /// [wakeLock] Whether to acquire wake lock while playing the video
  final bool wakeLock;

  /// [startingDuration] The duration where the video need to start
  final Duration startingDuration;

  /// [fit] how the Video need to see in the widget
  final BoxFit fit;

  /// [state] The full control to the video , player and ui elements
  ///
  /// Disclaimer
  ///
  /// * You need to give the controller to the videoPlayer or it will throw and error.Or you can't use it.
  /// * Also there are some methods that is for ui it may not work if you are using a custom or none ui
  late VideoPlayerState state;

  /// [PlayVideoController] is the controller passed in the VideoPlayer widget
  /// It Contain common functionality and my differs according to the input
  ///
  /// To access the state that contain all funtionality
  /// It must be given as a controller in the [PlayVideo]
  PlayVideoController({
    required this.videos,
    this.isAutoPlay = true,
    this.startingDuration = Duration.zero,
    this.fit = BoxFit.none,
    this.wakeLock = true,
    this.aspectRatio,
  }) {
    try {
      MediaKit.ensureInitialized();
    } catch (_) {}
  }
}
