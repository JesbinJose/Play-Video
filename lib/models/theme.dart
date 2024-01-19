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

  /// Text style for selected item in more settings
  final TextStyle menuSelectedItemStyle;

  /// Text style of menu items title
  final TextStyle menuItemTitleStyle;

  /// Style of menu Title
  final TextStyle menuTitleStyle;

  /// [PlayerTheme] has been defined defualt for all and it is in
  /// Black and White combination
  const PlayerTheme({
    this.iconsColor = Colors.white70,
    this.iconsSize = 15,
    this.progressBarTheme = const ProgressBarTheme(),
    this.backgroundColor = const Color.fromARGB(100, 0, 0, 0),
    this.menuItemStyle = const TextStyle(fontSize: 14,color: Colors.white54),
    this.menuItemTitleStyle = const TextStyle(fontSize: 16,color: Colors.white60),
    this.menuTitleStyle = const TextStyle(fontSize: 18,color: Colors.white70),
    this.menuSelectedItemStyle = const TextStyle(
      fontSize: 16,
      color: Colors.red,
    ),
  });
}

/// Progress Bar Theme
/// ------------------
/// Theme of the progress bar [ProgressBarTheme]
class ProgressBarTheme {
  /// Playing position style of the progress bar
  final Decoration primaryStyle;

  /// buffer style of the progress bar
  final Decoration secondartStyle;

  /// background style of the progress bar
  final Decoration backgroundStyle;

  /// Text style of progresstime
  final TextStyle progressTimeStyle;

  final double progressbarHeight;

  /// Progress Bar Theme
  /// ------------------
  /// Theme of the progress bar [ProgressBarTheme]
  const ProgressBarTheme({
    this.primaryStyle = const BoxDecoration(
      color: Colors.white70,
    ),
    this.secondartStyle = const BoxDecoration(
      color: Colors.white24,
    ),
    this.backgroundStyle = const BoxDecoration(
      color: Colors.black,
    ),
    this.progressTimeStyle = const TextStyle(
      fontSize: 12,
      color: Colors.white,
    ),
    this.progressbarHeight = 7,
  });
}
