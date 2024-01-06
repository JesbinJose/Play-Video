import 'package:flutter/material.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';
import 'package:play_video/widgets/overlay/overlay.dart';

class VideoPlayer extends StatefulWidget {
  const VideoPlayer({
    super.key,
  });

  @override
  State<VideoPlayer> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  final player = Player();
  late final controller = VideoController(player);

  @override
  void initState() {
    super.initState();
    player.open(
      Playlist(
        [
          Media(
            'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
          ),
          Media(
            'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4',
          ),
          Media(
            'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  final ValueNotifier<BoxFit> boxfit = ValueNotifier(BoxFit.none);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ValueListenableBuilder<BoxFit>(
        valueListenable: boxfit,
        builder: (_, v, __) {
          return Video(
            controller: controller,
            fit: v,
            controls: (state) {
              return OverlayPlayer(
                state: state,
                duration: const Duration(seconds: 2),
              );
            },
          );
        },
      ),
    );
  }

  
}
