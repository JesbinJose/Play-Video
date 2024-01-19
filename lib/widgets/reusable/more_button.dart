import 'package:flutter/material.dart';
import 'package:play_video/models/state.dart';

class MoreButton extends StatelessWidget {
  const MoreButton({
    super.key,
    required this.state,
    this.child,
  });

  final VideoPlayerState state;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        state.overlayOpacityNotifier.value = 0;
        state.moreOpacityNotifier.value = 1;
      },
      icon: child ?? const Icon(Icons.more_horiz),
    );
  }
}
