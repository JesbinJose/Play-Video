import 'package:flutter/material.dart';
import 'package:play_video/models/controls.dart';

class UnLockButton extends StatelessWidget {
  const UnLockButton({
    super.key,
    required this.lockNotifier,
    this.child,
    this.theme,
  });

  final ValueNotifier<bool> lockNotifier;
  final Widget? child;
  final PlayerTheme? theme;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        lockNotifier.value = false;
      },
      icon: child ??
          Icon(
            Icons.lock_open,
            size: theme?.iconsSize,
            color: theme?.iconsColor,
          ),
    );
  }
}
