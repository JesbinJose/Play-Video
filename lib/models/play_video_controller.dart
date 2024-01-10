import 'package:play_video/models/controls.dart';
import 'package:play_video/models/video_number.dart';

class PlayVideoController {
  final Videos videos;
  final bool isAutoPlay;
  final bool loop;
  final Duration startingDuration;
  final OverlayControls? control;
  PlayVideoController({
    required this.videos,
    this.isAutoPlay = true,
    this.loop = false,
    this.startingDuration = Duration.zero,
    this.control = const OverlayControls.deFault(),
  });
}
