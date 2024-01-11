
import 'package:flutter/material.dart';
import 'package:play_video/models/state.dart';
import 'package:play_video/models/theme.dart';

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
        return Container(
          width: double.infinity,
          height: double.infinity,
          color: theme.backgroundColor,
          child: AnimatedOpacity(
            opacity: opacity,
            duration: const Duration(milliseconds: 500),
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () => state.moreOpacityNotifier.value = 0,
                      icon: const Icon(Icons.arrow_back_ios_new_rounded),
                    ),
                    const Text(
                      'More settings',
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
