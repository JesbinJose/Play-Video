import 'package:flutter/material.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';
import 'package:play_video/models/controls.dart';
import 'package:play_video/models/play_video_controller.dart';
import 'package:play_video/models/state.dart';

class VideoPlayer extends StatefulWidget {
  const VideoPlayer({
    super.key,
    required this.size,
    required this.controller,
    required this.controls,
  });
  final PlayVideoController controller;
  final OverlayControls controls;
  final Size size;

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
      fill: Colors.transparent,
      width: widget.size.width,
      height: widget.size.height,
      controller: controller,
      fit: BoxFit.fill,
      controls: (state) {
        final VideoPlayerState s = VideoPlayerState(
          state: state,
          controller: controller,
          height: widget.size.height,
          widgth: widget.size.width,
        );
        widget.controller.state = s;
        return widget.controls.overlay!(s);
      },
    );
  }
}
