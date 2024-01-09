import 'package:flutter/material.dart';
import 'package:play_video/enums/enum.dart';

class PlayerTheme {
  late Color iconsColor;
  late ProgressBarTheme progressBarTheme;
  PlayerTheme.deFault() {
    iconsColor = Colors.white;
    progressBarTheme = ProgressBarTheme();
  }
}

class ProgressBarTheme {
  late ProgressBarType type;
  
  ProgressBarTheme();
}
