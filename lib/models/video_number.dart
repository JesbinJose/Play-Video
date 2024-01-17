import 'package:flutter/foundation.dart';
import 'package:media_kit/media_kit.dart';
import 'package:play_video/enums/enum.dart';
import 'video_type.dart';

export 'video_type.dart';

/// Videos
/// ------
///
/// Is Where You need to define how many or single video/videos do you want to play.
/// In a single player
///
/// ```dart
/// Videos.single("videoPath Or url", type) // single Video playing
/// Videos.multiVideoWithSingleType(["path 1","path 2"], type) // Multiple Video playing with single type
/// Videos.multiVideo([Video.network('url'),Video.file('path')]) // Multiple Video With diffrent types
/// ```
class Videos {
  /// [videos] `List<Media> `
  List<Media> videos = [];

  /// [Videos.single] is Used For Only playing a single Video
  ///
  /// ```dart
  /// Videos.single(videoPath:'path or url',type: type); // default type is VideoType.Network
  /// ```
  /// videoPath `String`
  ///
  /// type `VideoType`
  ///
  Videos.single({
    required String videoPath,
    VideoType type = VideoType.network,
  }) {
    switch (type) {
      case VideoType.file:
        if (kIsWeb) throw 'VideoType.file can\'t be used in web platform';
        videos = [Media('file:///$videoPath')];
        break;
      case VideoType.assets:
        videos = [Media('asset:///$videoPath')];
        break;
      default:
        videos = [Media(videoPath)];
    }
  }

  // Videos.memory({required Uint8List video}) {
  //   Media.memory(video).then((value) => videos.value = [value]);
  // }

  Videos.multiVideoWithSingleType({
    required List<String> videos,
    required VideoType type,
  }) {
    List<Media> result = [];
    // Future<List<Media>> addVideos(final List<Uint8List> data) async {
    //   final List<Media> videos = [];
    //   for (final video in data) {
    //     videos.add(await Media.memory(video));
    //   }
    //   return videos;
    // }

    switch (type) {
      case VideoType.file:
        if (kIsWeb) throw 'VideoType.file can\'t be used in web platform';
        for (final video in videos) {
          result.add(Media('file:///$video'));
        }
        this.videos = result;
        break;
      case VideoType.assets:
        for (final video in videos) {
          result.add(Media('asset:///$video'));
        }
        this.videos = result;
      // case VideoType.memory:
      //   addVideos(videos as List<Uint8List>).then(
      //     (value) => this.videos.value = value,
      //   );
      //   break;
      default:
        this.videos.addAll(
              List.generate(
                videos.length,
                (index) => Media(result[index].toString()),
              ),
            );
    }
  }

  Videos.multiVideo({required List<Video> videos}) {
    final List<Media> medias = [];
    for (Video video in videos) {
      switch (video.type) {
        case VideoType.file:
          if (kIsWeb) throw 'VideoType.file can\'t be used in web platform';
          medias.add(Media('file:///${video.video}'));
          break;
        case VideoType.assets:
          medias.add(Media('asset:///${video.video}'));
          break;
        // case VideoType.memory:
        //   Media.memory(video.video).then((value) => medias.add(value));
        //   break;
        default:
          medias.add(Media(video.video));
      }
      this.videos = medias;
    }
  }
}
