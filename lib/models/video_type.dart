import 'package:play_video/enums/enum.dart';

/// [Video] is the Type of Video
///
/// ```dart
/// final Video fileVideo = Video.file('Path to the video'); // Video form files (local storage)
/// final Video assetsVideo = Video.assets('Path to the video'); // Video from assets
/// final Video networkVideo = Video.network('Video Url'); // Video from network
/// ```
/// Need to pass in the controller for playing a video
class Video {
  final String video;
  late VideoType type;

  /// Can be used For only render Video from local storage
  ///
  /// Pass "Path of the video" as argument
  ///
  /// eg: Video.file('path of video');
  Video.file(this.video) {
    type = VideoType.file;
  }

  /// Can be used For only render Video from assets
  ///
  /// Pass "Path of the video" as argument.
  /// Also need to define Video in the assets of pubspec yaml
  ///
  /// eg: Video.assets('path of video');
  Video.assets(this.video) {
    type = VideoType.assets;
  }

  /// Can be used For only render Video from Network
  ///
  /// Pass "url" as argument ,
  /// Which need to be url for a video not any web page link.
  ///
  /// eg: Video.url('url');
  Video.network(this.video) {
    type = VideoType.network;
  }
  // Video.memory(Uint8List this.video) {
  //   type = VideoType.network;
  // }
}
