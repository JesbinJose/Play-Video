
import 'package:flutter/material.dart';
import 'package:play_video/models/state.dart';
import 'package:play_video/models/theme.dart';

class MoreSettingsTitle extends StatelessWidget {
  const MoreSettingsTitle({
    super.key,
    required this.state,
    required this.theme,
  });

  final VideoPlayerState state;
  final PlayerTheme theme;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () => state.moreOpacityNotifier.value = 0,
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
        Text(
          'More settings',
          style: theme.menuTitleStyle,
        ),
      ],
    );
  }
}
