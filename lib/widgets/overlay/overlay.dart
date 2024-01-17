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
              if (opacity == 0) {
                return InkWell(
                  onTap: () => d.run(),
                  child: const SizedBox(
                    width: double.infinity,
                    height: double.infinity,
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
                  return InkWell(
                    onTap: () => d.run(),
                    child: AnimatedOpacity(
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
                                icon: const Icon(
                                    Icons.arrow_back_ios_new_rounded),
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
                                    PlayPauseButton(state: state),
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
