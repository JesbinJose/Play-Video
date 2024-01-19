import 'package:flutter/material.dart';
import 'package:play_video/models/state.dart';

class PreviousButton extends StatelessWidget {
  const PreviousButton({
    super.key,
    required this.state,
  });

  final VideoPlayerState state;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => state.previous(),
      icon: const Icon(
        Icons.skip_previous_rounded,
      ),
    );
  }
}