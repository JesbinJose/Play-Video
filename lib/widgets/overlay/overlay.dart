import 'package:flutter/material.dart';
import 'package:play_video/models/state.dart';
import 'package:play_video/models/theme.dart';

final ValueNotifier<double> _overlayOpacityNotifier = ValueNotifier(1);
final ValueNotifier<double> _moreOpacityNotifier = ValueNotifier(0);

class OverlayPlayer extends StatelessWidget {
  const OverlayPlayer({
    super.key,
    required this.state,
    required this.theme,
  });
  final VideoPlayerState state;
  final PlayerTheme theme;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ValueListenableBuilder<double>(
          valueListenable: _overlayOpacityNotifier,
          builder: (context, opacity, child) {
            if (opacity == 0) {
              return Container();
            }
            return Center(
              child: AnimatedOpacity(
                opacity: opacity,
                duration: const Duration(milliseconds: 500),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: const Icon(Icons.arrow_back_ios_new_rounded),
                        ),
                        GestureDetector(
                          child: IconButton(
                            onPressed: () {
                              _overlayOpacityNotifier.value = 0;
                            },
                            icon: const Icon(Icons.more_horiz),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [],
                    ),
                    Row(
                      children: [],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        ValueListenableBuilder(
          valueListenable: _moreOpacityNotifier,
          builder: (context, opacity, child) {
            return Center(
              child: AnimatedOpacity(
                opacity: opacity,
                duration: const Duration(milliseconds: 500),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: const Icon(Icons.arrow_back_ios_new_rounded),
                        ),
                        IconButton(
                          onPressed: () {
                            _overlayOpacityNotifier.value = 0;
                          },
                          icon: const Icon(Icons.more_horiz),
                        ),
                      ],
                    ),
                    Row(
                      children: [],
                    ),
                    Row(
                      children: [],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  Future<void> setTimer(Duration duration) async {
    await Future.delayed(duration);
  }
}
