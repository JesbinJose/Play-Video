library play_video;

import 'package:flutter/widgets.dart';
import 'package:media_kit/media_kit.dart';
import 'package:play_video/models/play_video_controller/play_video_controller.dart';
import 'package:play_video/variables.dart';
import 'package:play_video/widgets/video_player.dart';

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
        ],
      ),
    );
  }
}
