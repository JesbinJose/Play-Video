import 'package:flutter/material.dart';

class UIOperations {
  final bool isPlaying;
  final List<String> paths;
  UIOperations({required this.isPlaying, required this.paths});

  /// [lockNotifier] is a valueNotifier which control lock Screen
  final ValueNotifier<bool> lockNotifier = ValueNotifier(false);

  /// [overlayOpacityNotifier] is a valueNotifier which control overlay Video/Player Controls
  final ValueNotifier<double> overlayOpacityNotifier = ValueNotifier(1);

  /// [moreOpacityNotifier] is a valueNotifier which control the Menu or more settings screen
  final ValueNotifier<double> moreOpacityNotifier = ValueNotifier(0);

  /// [isPlay] is a valueNotifier notifies when video state change from play and pause
  late ValueNotifier<bool> isPlay = ValueNotifier(isPlaying);

  late ValueNotifier<int> currentPlayingVideo = ValueNotifier(1);

  /// Lock the Player for reducing accidental touches
  void lock() => lockNotifier.value = true;

  /// Remove the Lock Screen to access controls
  void unLock() => lockNotifier.value = false;

  /// Show the Controls over Player
  void showControls() => overlayOpacityNotifier.value = 1;

  /// Hide Controls
  void hideControls() => overlayOpacityNotifier.value = 0;

  /// ToggleControls
  void toggleControl() =>
      overlayOpacityNotifier.value = overlayOpacityNotifier.value == 1 ? 0 : 1;

  /// Show More Controls Page or Menu
  void showMenu() => moreOpacityNotifier.value = 1;

  /// Hide More Controls Page or Menu
  void exitMenu() => moreOpacityNotifier.value = 0;
}
