/// This is the screen where The [PlayVideoController] is written
import 'package:play_video/models/enums/play_video_controller.dart';
import 'package:play_video/models/video_type/video_type.dart';

/// [PlayVideoController] is the main class or the Controller for the full Video Player Conrtol
class PlayVideoController {
  late PlayVideoControllerType type;
  late List<Video> videos;


  PlayVideoController.single({
    required Video video,
  }) {
    type = PlayVideoControllerType.single;
    videos = [video];
  }

  
  PlayVideoController.multi({
    required this.videos,
  }) {
    type = PlayVideoControllerType.multi;
  }
}
