import 'package:flutter/material.dart';
import 'package:play_video/models/state.dart';

class NextButton extends StatelessWidget {
  const NextButton({
    super.key,
    required this.state,
    this.child,
  });

  final VideoPlayerState state;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => state.next(),
      icon: child ??
          const Icon(
            Icons.skip_next_rounded,
          ),
    );
  }
}
