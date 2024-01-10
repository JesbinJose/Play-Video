import 'package:flutter/material.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';
import 'package:play_video/models/play_video_controller.dart';

class VideoPlayer extends StatefulWidget {
  const VideoPlayer({
    super.key,
    required this.controller,
  });
  final PlayVideoController controller;

  @override
  State<VideoPlayer> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  final player = Player();
  late final controller = VideoController(player);
  late PlayVideoController _controller;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller;
    player.open(Playlist(_controller.videos.videos.value));
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Video(
      width: _controller.width,
      height: _controller.height,
      controller: controller,
    );
  }
}
