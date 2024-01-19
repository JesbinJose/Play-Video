import 'package:flutter/material.dart';
import 'package:play_video/models/state.dart';

class PreviousButton extends StatelessWidget {
  const PreviousButton({
    super.key,
    required this.state,
    this.child,
  });

  final VideoPlayerState state;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => state.previous(),
      icon: child ??
          const Icon(
            Icons.skip_previous_rounded,
          ),
    );
  }
}
