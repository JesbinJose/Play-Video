library play_video;

import 'package:flutter/widgets.dart';
import 'package:play_video/models/play_video_controller/play_video_controller.dart';

class PlayVideo extends StatelessWidget {
  const PlayVideo({
    required this.controller,
    super.key,
  });
  final PlayVideoController controller;

  @override
  Widget build(BuildContext context) {
    final PlayVideoController con = PlayVideoController.multi();
    // main widget
    return const SizedBox();
  }
}
