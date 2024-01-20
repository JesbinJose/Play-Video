import 'package:flutter/material.dart';
import 'package:play_video/models/state.dart';
import 'package:play_video/models/theme.dart';
import 'package:play_video/widgets/reusable/boxfit_tile_menu.dart';
import 'package:play_video/widgets/reusable/more_settings_title.dart';
import 'package:play_video/widgets/reusable/speed_control_tile.dart';

class MoreSettingsWidget extends StatelessWidget {
  const MoreSettingsWidget({
    super.key,
    required this.state,
    required this.theme,
  });

  final VideoPlayerState state;
  final PlayerTheme theme;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: state.moreOpacityNotifier,
      builder: (context, opacity, child) {
        if (opacity == 0) {
          return const SizedBox.shrink();
        }
        return AnimatedOpacity(
          opacity: opacity,
          duration: const Duration(milliseconds: 500),
          child: InkWell(
            onTap: () => state.moreOpacityNotifier.value = 0,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              margin: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: Colors.black45,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  MoreSettingsTitle(state: state, theme: theme),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width*.8,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Divider(
                          color: Colors.white12,
                        ),
                        BoxFitControlTile(state: state, theme: theme),
                        const Divider(
                          color: Colors.white12,
                        ),
                        SpeedControlTile(state: state, theme: theme),
                        const Divider(
                          color: Colors.white12,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
