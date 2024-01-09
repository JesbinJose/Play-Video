import 'package:flutter/material.dart';
import 'package:play_video/responsive.dart';

class OverlayPlayer extends StatelessWidget {
  OverlayPlayer({super.key,});
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
            child: Responsive.widget(
              context,
              small: const Column(
                children: [
                  Row(),
                  Row(),
                ],
              ),
              large: const Column(
                children: [
                  Row(),
                  Row(),
                ],
              ),
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
