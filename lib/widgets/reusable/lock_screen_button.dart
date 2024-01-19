import 'package:flutter/material.dart';
import 'package:play_video/models/state.dart';

class LockScreenButton extends StatelessWidget {
  const LockScreenButton({
    super.key,
    required this.state,
    this.child,
  });

  final VideoPlayerState state;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => state.lockNotifier.value = true,
      icon: child ?? const Icon(Icons.lock),
    );
  }
}
