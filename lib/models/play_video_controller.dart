import 'package:play_video/models/controls.dart';
import 'package:play_video/models/video_number.dart';

class PlayVideoController {
  final Videos videos;
  final double width;
  final double height;
  final bool isAutoPlay;
  final bool loop;
  final Duration startingDuration;
  late OverlayControls? control;
  PlayVideoController({
    required this.videos,
    this.width = 500,
    this.height = 300,
    this.isAutoPlay = true,
    this.loop = false,
    this.startingDuration = Duration.zero,
    OverlayControls? control,
  }) {
    control = control ?? OverlayControls.deFault();
  }
}
