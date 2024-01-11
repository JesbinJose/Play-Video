import 'package:play_video/models/state.dart';
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
  });
  VideoPlayerState? _state;
  void enterFullScreen() {
    if (_state == null) {
      throw 'You need to assign controller to a video player';
    } else {
      _state!.enterFullScreen();
    }
  }
}
