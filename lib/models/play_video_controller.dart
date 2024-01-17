import 'package:flutter/material.dart';
import 'package:play_video/models/state.dart';
import 'package:play_video/models/video_number.dart';

export 'video_number.dart';
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
  final Duration startingDuration;
  final BoxFit fit;
  late VideoPlayerState state;
  PlayVideoController( {
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
