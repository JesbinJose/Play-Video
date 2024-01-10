import 'package:flutter/material.dart';
// import 'package:play_video/enums/enum.dart';

class PlayerTheme {
  final Color iconsColor;
  final double iconsSize;
  final ProgressBarTheme progressBarTheme;
  PlayerTheme.deFault({
    this.iconsColor = Colors.white70,
    this.iconsSize = 15,
    this.progressBarTheme = const ProgressBarTheme(),
  });
}

class ProgressBarTheme {
  // late ProgressBarType type;
  final Color progressColor;
  final Color backgroundColor;
  const ProgressBarTheme({
    this.progressColor = Colors.white70,
    this.backgroundColor = Colors.white24,
  });
}
