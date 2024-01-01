library play_video;

import 'package:flutter/widgets.dart';
import 'package:play_video/player.dart';
import 'models/models.dart';
export 'models/models.dart';

class PlayVideo extends StatelessWidget {
  const PlayVideo({
    required this.controller,
    super.key,
  });
  final PlayVideoController controller;

  @override
  Widget build(BuildContext context) {
    // main widget
    return Player(controller: controller);
  }
}
