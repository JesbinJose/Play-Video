import 'package:flutter/material.dart';
import 'package:play_video/function/format_duration.dart';
import 'package:play_video/function/timer.dart';
import 'package:play_video/models/controls.dart';
import 'package:play_video/widgets/reusable/progressbar.dart';

class ProgressPart extends StatelessWidget {
  const ProgressPart({
    super.key,
    required this.state,
    required this.d,
    required this.theme,
  });

  final VideoPlayerState state;
  final Debouncer d;
  final ProgressBarTheme theme;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        StreamBuilder(
          stream: state.stream.position,
          builder: (context, snapshot) {
            return Text(
              formatDuration(
                snapshot.data ?? Duration.zero,
              ),
              style: theme.progressTimeStyle,
            );
          },
        ),
        DefaultProgressBar(
          state: state,
          debouncer: d,
          theme: theme,
        ),
        StreamBuilder(
          stream: state.stream.position,
          builder: (context, snapshot) {
            final Duration duration =
                state.state.duration - (snapshot.data ?? Duration.zero);
            return Text(
              '- ${formatDuration(
                duration,
              )}',
              style: theme.progressTimeStyle,
            );
          },
        ),
      ],
    );
  }
}
