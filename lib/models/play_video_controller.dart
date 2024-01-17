import 'package:flutter/material.dart';
import 'package:play_video/models/state.dart';
import 'package:play_video/models/video_number.dart';

export 'controls.dart';
export 'methods.dart';
export 'state.dart';
export 'video_number.dart';
export 'theme.dart';
export 'package:play_video/enums/enum.dart';

/// [PlayVideoController] is the controller passed in the VideoPlayer widget
/// It Contain common functionality and my differs according to the input
class PlayVideoController {
  final Videos videos;
  final bool isAutoPlay;
  final bool loop;
  final bool wakeLock;
  final Duration startingDuration;
  final BoxFit fit;
  late VideoPlayerState state;
  PlayVideoController({
    required this.videos,
    this.isAutoPlay = true,
    this.loop = false,
    this.startingDuration = Duration.zero,
    this.fit = BoxFit.none,
    this.wakeLock = true,
  }) {
    try {
      MediaKit.ensureInitialized();
    } catch (_) {}
  }
}
