import 'package:media_kit/media_kit.dart';
import 'package:play_video/models/video_number.dart';

class PlayVideoController {
  final Videos videos;
  final bool isAutoPlay;
  final bool loop;
  final Duration startingDuration;
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
