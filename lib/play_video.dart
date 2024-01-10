library play_video;

import 'package:flutter/widgets.dart';
import 'package:media_kit/media_kit.dart';
import 'package:play_video/models/play_video_controller.dart';
import 'package:play_video/widgets/video_player.dart';

class PlayVideo extends StatelessWidget {
  const PlayVideo({
    required this.controller,
    this.width = 500,
    this.height = 300,
    super.key,
  });
  final PlayVideoController controller;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    try {
      MediaKit.ensureInitialized();
    } catch (_) {}
    // main widget
    return VideoPlayer(
      controller: controller,
      size: Size(
        width,
        height,
      ),
    );
  }
}
