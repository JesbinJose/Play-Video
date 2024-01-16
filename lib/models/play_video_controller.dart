import 'package:play_video/models/state.dart';
import 'package:play_video/models/video_number.dart';

class PlayVideoController {
  final Videos videos;
  final bool isAutoPlay;
  final bool loop;
  final Duration startingDuration;
  late VideoPlayerState state;
  PlayVideoController({
    required this.videos,
    this.isAutoPlay = true,
    this.loop = false,
    this.startingDuration = Duration.zero,
  }) {
    try {
      MediaKit.ensureInitialized();
    } catch (_) {}
  }
}
