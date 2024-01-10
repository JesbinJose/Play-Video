import 'package:flutter/foundation.dart';
import 'package:media_kit/media_kit.dart';
import 'package:play_video/enums/enum.dart';
import 'package:play_video/models/video_type.dart';

class Videos {
  ValueNotifier<List<Media>> videos = ValueNotifier([]);
  Videos.single({
    required String videoPath,
    VideoType type = VideoType.network,
  }) {
    switch (type) {
      case VideoType.file:
        videos.value = [Media('file:///$videoPath')];
        break;
      case VideoType.assets:
        videos.value = [Media('asset:///$videoPath')];
        break;
      default:
        videos.value = [Media(videoPath)];
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
        for (final video in videos) {
          result.add(Media('file:///$video'));
        }
        this.videos.value = result;
        break;
      case VideoType.assets:
        for (final video in videos) {
          result.add(Media('asset:///$video'));
        }
        this.videos.value = result;
      // case VideoType.memory:
      //   addVideos(videos as List<Uint8List>).then(
      //     (value) => this.videos.value = value,
      //   );
      //   break;
      default:
        this.videos.value.addAll(
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
      this.videos.value = medias;
    }
  }
}
