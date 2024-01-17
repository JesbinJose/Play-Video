import 'package:flutter/material.dart';

/// PlayerTheme
/// -----------
/// Is the the class where You need to define the theme of the player
class PlayerTheme {
  /// [iconsColor] The color of all icons in the player
  final Color iconsColor;

  /// [iconsSize] The size of all icons in the player
  final double iconsSize;

  /// [backgroundColor] The color of all part where shows the backround part
  /// In menu , controls , etc
  final Color backgroundColor;

  /// Theme of the progressbar [ProgressBarTheme]
  final ProgressBarTheme progressBarTheme;

  /// Text style of menu items
  final TextStyle menuItemStyle;

  /// Text style of menu items title
  final TextStyle menuItemTitleStyle;

  /// Text style of progresstime
  final TextStyle progressTimeStyle;

  /// [PlayerTheme] has been defined defualt for all and it is in
  /// Black and White combination
  const PlayerTheme({
    this.iconsColor = Colors.white70,
    this.iconsSize = 15,
    this.progressBarTheme = const ProgressBarTheme(),
    this.backgroundColor = const Color.fromARGB(100, 0, 0, 0),
    this.menuItemStyle = const TextStyle(fontSize: 14),
    this.progressTimeStyle = const TextStyle(fontSize: 14),
    this.menuItemTitleStyle = const TextStyle(fontSize: 16),
  });
}

/// Progress Bar Theme
/// ------------------
/// Theme of the progress bar [ProgressBarTheme]
class ProgressBarTheme {
  // late ProgressBarType type;
  /// main color of the progress bar
  final Color progressColor;

  /// background color of the progress bar
  final Color backgroundColor;

  /// Progress Bar Theme
  /// ------------------
  /// Theme of the progress bar [ProgressBarTheme]
  const ProgressBarTheme({
    this.progressColor = Colors.white70,
    this.backgroundColor = Colors.white24,
  });
}
