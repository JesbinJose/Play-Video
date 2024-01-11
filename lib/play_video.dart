library play_video;

import 'package:flutter/material.dart';
import 'package:play_video/models/controls.dart';
import 'package:play_video/models/play_video_controller.dart';
import 'package:play_video/widgets/video_player.dart';

// ignore: must_be_immutable
class PlayVideo extends StatelessWidget {
  PlayVideo({
    super.key,
    required this.controller,
    OverlayControls? control,
    this.width = 500,
    this.height = 300,
    this.decoration = const BoxDecoration(color: Colors.black),
    this.padding,
    this.margin,
    this.videoBorderRadius = BorderRadius.zero,
  }) {
    this.control = control ?? OverlayControls.deFault();
  }
  late OverlayControls control;
  final PlayVideoController controller;
  final double width;
  final double height;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Decoration decoration;
  final BorderRadiusGeometry videoBorderRadius;

  @override
  Widget build(BuildContext context) {
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
          controls: control,
        ),
      ),
    );
  }
}
