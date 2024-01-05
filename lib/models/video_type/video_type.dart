import 'package:play_video/models/enums/video_type.dart';

class Video {
  final dynamic video;
  late VideoType type;
  Video.file(this.video) {
    type = VideoType.file;
  }
  Video.assets(this.video) {
    type = VideoType.assets;
  }
  Video.network(this.video) {
    type = VideoType.network;
  }
  Video.memory(this.video) {
    type = VideoType.memory;
  }
}
