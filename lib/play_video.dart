// ignore_for_file: must_be_immutable

library play_video;

import 'package:flutter/material.dart';
import 'package:play_video/models/controls.dart';
import 'package:play_video/models/notifiers.dart';
import 'package:play_video/models/play_video_controller.dart';
import 'package:play_video/widgets/video_player.dart';

export 'package:play_video/models/play_video_controller.dart';
export 'package:play_video/models/controls.dart';
export 'package:play_video/function/init.dart';

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
    this.fit = BoxFit.contain,
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
  final BoxFit fit;
  final BorderRadiusGeometry videoBorderRadius;

  @override
  Widget build(BuildContext context) {
    AllNotifiers.fitNotifier = ValueNotifier(fit);
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
