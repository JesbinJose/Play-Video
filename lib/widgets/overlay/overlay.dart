// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:play_video/function/timer.dart';
import 'package:play_video/models/state.dart';
import 'package:play_video/models/theme.dart';
import 'package:play_video/widgets/overlay/lock_screen.dart';
import 'package:play_video/widgets/overlay/more_settings_widget.dart';
// import 'package:play_video/widgets/overlay/screenshot_button.dart';
import 'package:play_video/widgets/progress_part.dart';
import 'package:play_video/widgets/reusable/full_screen_toggle_button.dart';
import 'package:play_video/widgets/reusable/play_pause_button.dart';

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
    final Debouncer d = Debouncer(state: state);
    return SafeArea(
      child: Stack(
        children: [
          ValueListenableBuilder<double>(
            valueListenable: state.overlayOpacityNotifier,
            builder: (context, opacity, child) {
              if (opacity == 0.0) {
                return SizedBox(
                  height: state.height,
                  width: state.width,
                  child: GestureDetector(
                    onTap: () => d.run(),
                    onHorizontalDragUpdate: (details) {
                      if (!state.isPlaying) state.play();
                      // d.run();
                      final newValue =
                          (details.localPosition.dx / context.size!.width)
                              .clamp(0.0, 1.0);
                      final seekTo =
                          newValue * state.state.duration.inMilliseconds;
                      state.seek(Duration(milliseconds: seekTo.toInt()));
                    },
                  ),
                );
              }
              d.run();
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
                    child: InkWell(
                      onTap: () => d.dispose(),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                onPressed: () => Navigator.pop(context),
                                icon: const Icon(
                                  Icons.arrow_back_ios_new_rounded,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  state.overlayOpacityNotifier.value = 0;
                                  state.moreOpacityNotifier.value = 1;
                                },
                                icon: const Icon(Icons.more_horiz),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              IconButton(
                                onPressed: () =>
                                    state.lockNotifier.value = true,
                                icon: const Icon(Icons.lock),
                              ),
                              // const Spacer(),
                              // if (!kIsWeb) ScreenShotButton(state: state),
                            ],
                          ),
                          Container(
                            color: theme.backgroundColor,
                            child: Column(
                              children: [
                                ProgressPart(state: state, d: d),
                                Row(
                                  children: [
                                    IconButton(
                                      onPressed: () => state.previous(),
                                      icon: const Icon(
                                        Icons.skip_previous_rounded,
                                      ),
                                    ),
                                    PlayPauseButton(state: state),
                                    IconButton(
                                      onPressed: () => state.next(),
                                      icon: const Icon(
                                        Icons.skip_next_rounded,
                                      ),
                                    ),
                                    const Spacer(),
                                    EnterExitFullScreenButton(state: state),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
          MoreSettingsWidget(state: state, theme: theme),
        ],
      ),
    );
  }
}
