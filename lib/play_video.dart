library play_video;

import 'package:flutter/material.dart';
import 'package:media_kit/media_kit.dart';
import 'package:play_video/models/controls.dart';
import 'package:play_video/models/play_video_controller.dart';
import 'package:play_video/widgets/video_player.dart';

class PlayVideo extends StatelessWidget {
  const PlayVideo({
    super.key,
    required this.controller,
    this.width = 500,
    this.height = 300,
    this.control = const OverlayControls.deFault(),
    this.decoration = const BoxDecoration(color: Colors.black),
    this.padding,
    this.margin,
    this.videoBorderRadius = BorderRadius.zero,
  });
  final OverlayControls? control;
  final PlayVideoController controller;
  final double width;
  final double height;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Decoration decoration;
  final BorderRadiusGeometry videoBorderRadius;

  @override
  Widget build(BuildContext context) {
    try {
      MediaKit.ensureInitialized();
    } catch (_) {}
    // main widget
    return Container(
      padding: padding,
      margin: margin,
      decoration: decoration,
      child: ClipRRect(
        borderRadius: videoBorderRadius,
        child: VideoPlayer(
          controller: controller,
          size: Size(
            width,
            height,
          ),
        ),
      ),
    );
  }
}
