import 'package:flutter/material.dart';
import 'package:play_video/models/controls.dart';

class ExitButton extends StatelessWidget {
  const ExitButton({
    super.key,
    this.child,
    this.theme,
  });
  final Widget? child;
  final PlayerTheme? theme;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => Navigator.pop(context),
      icon: child ??
          Icon(
            Icons.arrow_back_ios_new_rounded,
            size: theme?.iconsSize,
            color: theme?.iconsColor,
          ),
    );
  }
}
