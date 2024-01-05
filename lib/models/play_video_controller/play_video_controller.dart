/// This is the screen where The [PlayVideoController] is written
import 'package:play_video/models/enums/play_video_controller.dart';

/// [PlayVideoController] is the main class or the Controller for the full Video Player Conrtol
class PlayVideoController {
  late PlayVideoControllerType type;
  PlayVideoController.single({
    required String video,
  }) {
    type = PlayVideoControllerType.single;
  }
  PlayVideoController.multi() {
    type = PlayVideoControllerType.multi;
  }
}
