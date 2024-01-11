import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:play_video/models/state.dart';
import 'package:play_video/models/theme.dart';
import 'package:play_video/widgets/overlay/lock_screen.dart';
import 'package:play_video/widgets/overlay/screenshot_button.dart';

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
          valueListenable: state.overlayOpacityNotifier,
          builder: (context, opacity, child) {
            if (opacity == 0) {
              return InkWell(
                onTap: () => state.overlayOpacityNotifier.value = 1,
                child: const SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                ),
              );
            }
            setTimer(
              const Duration(seconds: 3),
            );
            return ValueListenableBuilder(
              valueListenable: state.lockNotifier,
              builder: (context, value, child) {
                if (value) {
                  return LockScreen(
                    opacity: opacity,
                    lockNotifier: state.lockNotifier,
                  );
                }
                return AnimatedOpacity(
                  opacity: opacity,
                  duration: const Duration(milliseconds: 500),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              state.overlayOpacityNotifier.value = 0;
                            },
                            icon: const Icon(Icons.more_horiz),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () => state.lockNotifier.value = true,
                            icon: const Icon(Icons.lock),
                          ),
                          if (!kIsWeb) ScreenShotButton(state: state),
                        ],
                      ),
                      Container(
                        color: theme.backgroundColor,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () => state.playOrPause(),
                                  icon: const Icon(
                                    Icons.play_arrow,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
        ValueListenableBuilder(
          valueListenable: state.moreOpacityNotifier,
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
                            state.overlayOpacityNotifier.value = 0;
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
    state.overlayOpacityNotifier.value = 0;
  }
}
