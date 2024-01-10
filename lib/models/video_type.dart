// import 'package:flutter/foundation.dart';
import 'package:play_video/enums/enum.dart';

class Video {
  final String video;
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
  // Video.memory(Uint8List this.video) {
  //   type = VideoType.network;
  // }
}
