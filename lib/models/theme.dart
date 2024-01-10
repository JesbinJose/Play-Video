import 'package:flutter/material.dart';
// import 'package:play_video/enums/enum.dart';

class PlayerTheme {
  final Color iconsColor;
  final double iconsSize;
  final Color backgroundColor;
  final ProgressBarTheme progressBarTheme;
  final TextStyle titileStyle;
  final TextStyle progressTimeStyle;
  const PlayerTheme({
    this.iconsColor = Colors.white70,
    this.iconsSize = 15,
    this.progressBarTheme = const ProgressBarTheme(),
    this.backgroundColor = const Color.fromARGB(100, 0, 0, 0),
    this.titileStyle = const TextStyle(fontSize: 20),
    this.progressTimeStyle = const TextStyle(fontSize: 14),
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
