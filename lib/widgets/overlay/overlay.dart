import 'package:flutter/material.dart';
import 'package:play_video/function/timer.dart';
import 'package:play_video/models/state.dart';
import 'package:play_video/models/theme.dart';
import 'package:play_video/widgets/overlay/lock_screen.dart';
import 'package:play_video/widgets/overlay/more_settings_widget.dart';
import 'package:play_video/widgets/overlay/overlay_hidden_controls.dart';
import 'package:play_video/widgets/reusable/lock_screen_button.dart';
import 'package:play_video/widgets/reusable/reusable.dart';

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
                return OverlayHiddenControls(state: state, d: d);
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
                              const ExitButton(),
                              MoreButton(state: state),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              LockScreenButton(state: state),
                              // const Spacer(),
                              // if (!kIsWeb) ScreenShotButton(state: state),
                            ],
                          ),
                          BottomControls(theme: theme, state: state, d: d),
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

