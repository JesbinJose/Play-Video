import 'package:flutter/material.dart';
import 'package:play_video/function/timer.dart';
import 'package:play_video/models/state.dart';
import 'package:play_video/models/theme.dart';
import 'package:play_video/widgets/progress_part.dart';
import 'package:play_video/widgets/reusable/fav_toggle_button.dart';
import 'package:play_video/widgets/reusable/full_screen_toggle_button.dart';
import 'package:play_video/widgets/reusable/next_button.dart';
import 'package:play_video/widgets/reusable/play_pause_button.dart';
import 'package:play_video/widgets/reusable/previous_button.dart';
import 'package:play_video/widgets/reusable/volume_toggle_button.dart';

class BottomControls extends StatelessWidget {
  const BottomControls({
    super.key,
    required this.theme,
    required this.state,
    required this.d,
  });

  final PlayerTheme theme;
  final VideoPlayerState state;
  final Debouncer d;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: theme.backgroundColor,
      child: Column(
        children: [
          ProgressPart(state: state, d: d, theme: theme.progressBarTheme,),
          Row(
            children: [
              PreviousButton(state: state),
              PlayPauseButton(state: state),
              NextButton(state: state),
              DefaultMuteToggleButton(state: state),
              const Spacer(),
              FavToggleButton(
                path: state.paths[
                    state.currentPlayingVideo.value],
              ),
              EnterExitFullScreenButton(state: state),
            ],
          ),
        ],
      ),
    );
  }
}



