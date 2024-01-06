library play_video;

import 'package:flutter/widgets.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';
import 'package:play_video/models/play_video_controller/play_video_controller.dart';
import 'package:play_video/variables.dart';

class PlayVideo extends StatelessWidget {
  const PlayVideo({
    required this.controller,
    super.key,
  });
  final PlayVideoController controller;

  @override
  Widget build(BuildContext context) {
    try {
      MediaKit.ensureInitialized();
    } catch (_) {}
    size = MediaQuery.sizeOf(context);
    // main widget
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Stack(
        children: [
          const VideoPlayer(),
          Container(),
          Container(),
        ],
      ),
    );
  }
}

class VideoPlayer extends StatefulWidget {
  const VideoPlayer({
    super.key,
  });

  @override
  State<VideoPlayer> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  late final player = Player();
  late final controller = VideoController(player);

  @override
  void initState() {
    super.initState();
    player.open(Media(
        'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4'));
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Video(controller: controller),
    );
  }
}
