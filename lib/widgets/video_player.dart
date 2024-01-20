import 'package:flutter/material.dart';
import 'package:media_kit_video/media_kit_video.dart' as v;
import 'package:play_video/models/controls.dart';
import 'package:play_video/models/play_video_controller.dart';

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
  late final controller = v.VideoController(player);
  late PlayVideoController _controller;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller;
    player.open(Playlist(_controller.videos.videos));
    player.seek(_controller.startingDuration);
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return v.Video(
      width: widget.size.width,
      height: widget.size.height,
      controller: controller,
      fit: _controller.fit,
      aspectRatio: _controller.aspectRatio,
      wakelock: _controller.wakeLock,
      controls: (state) {
        _controller.isAutoPlay ? player.play() : player.pause();
        final VideoPlayerState s = VideoPlayerState(
          state: state,
          controller: controller,
          paths: List.generate(
            _controller.videos.videos.length,
            (index) => _controller.videos.videos[index].uri,
          ),
          height: widget.size.height,
          width: widget.size.width,
        );
        widget.controller.state = s;
        return widget.controls.overlay!(s);
      },
    );
  }
}
