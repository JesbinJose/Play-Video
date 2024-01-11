import 'package:media_kit_video/media_kit_video.dart';

class VideoPlayerState {
  final VideoState state;
  VideoPlayerState({required this.state});
  void enterFullScreen() => state.enterFullscreen();
  void exitFullScreen() => state.exitFullscreen();
}
