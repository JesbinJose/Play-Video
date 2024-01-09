import 'package:play_video/enums/enum.dart';

class Video {
  late dynamic video;
  late VideoType type;
  Video.file(String this.video) {
    type = VideoType.file;
  }
  Video.assets(this.video) {
    type = VideoType.assets;
  }
  Video.network(this.video) {
    type = VideoType.network;
  }
}
