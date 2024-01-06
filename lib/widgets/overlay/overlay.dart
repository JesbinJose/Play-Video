import 'package:flutter/material.dart';
import 'package:media_kit_video/media_kit_video.dart';

class OverlayPlayer extends StatelessWidget {
  OverlayPlayer({super.key, required this.state, required this.duration});
  final Duration duration;
  final VideoState state;
  final ValueNotifier<double> _opacityNotifier = ValueNotifier(1);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<double>(
      valueListenable: _opacityNotifier,
      builder: (context, opacity, child) {
        return Center(
          child: AnimatedOpacity(
            opacity: opacity,
            duration: const Duration(milliseconds: 500),
            child: Column(
              children: [
                Row(),
                Row(),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> setTimer(Duration duration) async {
    await Future.delayed(duration);
  }
}
