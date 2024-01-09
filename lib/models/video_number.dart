import 'package:flutter/foundation.dart';
import 'package:media_kit/media_kit.dart';
import 'package:play_video/enums/enum.dart';

class Videos {
  ValueNotifier<List<Media>> videos = ValueNotifier([]);
  Videos.single({
    required dynamic video,
    VideoType type = VideoType.network,
  }) {
    switch (type) {
      case VideoType.file:
        videos.value.add(Media('file:///$video'));
        break;
      case VideoType.assets:
        videos.value.add(Media('asset:///$video'));
        break;
      case VideoType.memory:
        Media.memory(video).then((value) => videos.value.add(value));
        break;
      default:
        videos.value.add(Media(video));
    }
  }
  
  Videos.multiVideoWithSingleType({
    required List<dynamic> videos,
    required VideoType type,
  }) {
    List<Media> result = [];
    Future<List<Media>> addVideos(final List<Uint8List> data) async {
      final List<Media> videos = [];
      for (final video in data) {
        videos.add(await Media.memory(video));
      }
      return videos;
    }

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
      case VideoType.memory:
        addVideos(videos as List<Uint8List>).then(
          (value) => this.videos.value = value,
        );
        break;
      default:
        this.videos.value.addAll(
              List.generate(
                videos.length,
                (index) => Media(
                  '${result[index]}',
                ),
              ),
            );
    }
  }
}
