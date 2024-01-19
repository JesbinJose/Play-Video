import 'package:flutter/material.dart';
import 'package:play_video/function/timer.dart';
import 'package:play_video/play_video.dart';

double _time = 0;

class DefaultProgressBar extends StatelessWidget {
  final VideoPlayerState state;
  final Debouncer debouncer;
  final ProgressBarTheme theme;
  const DefaultProgressBar({
    super.key,
    required this.state,
    required this.debouncer,
    required this.theme,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onHorizontalDragUpdate: (details) {
          debouncer.run();
          final seekTo =
              (details.localPosition.dx / context.size!.width).clamp(0.0, 1.0) *
                  state.state.duration.inMilliseconds;
          state.seek(
            Duration(
              milliseconds: seekTo.toInt(),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: _dualProgressBar(
            theme: theme,
            currentPosition: state.stream.position,
            bufferdPosition: state.stream.buffer,
            state: state,
          ),
        ),
      ),
    );
  }

  Widget _dualProgressBar({
    required Stream<Duration> currentPosition,
    required Stream<Duration> bufferdPosition,
    required VideoPlayerState state,
    required ProgressBarTheme theme,
  }) {
    double calculateValue(Duration position, Duration duration) {
      if (position == Duration.zero) return _time;
      _time = position.inMilliseconds / duration.inMilliseconds;
      return _time;
    }
    return Container(
      width: double.infinity,
      height: theme.progressbarHeight,
      decoration: theme.backgroundStyle,
      child: Stack(
        children: [
          StreamBuilder(
            stream: bufferdPosition,
            builder: (context, v) {
              final position = v.data != null ? v.data! : Duration.zero;
              final value = calculateValue(position, state.state.duration);
              return FractionallySizedBox(
                widthFactor: value,
                child: Container(
                  alignment: Alignment.centerRight,
                  decoration: theme.secondartStyle,
                ),
              );
            },
          ),
          StreamBuilder(
            stream: currentPosition,
            builder: (context, v) {
              final position = v.data != null ? v.data! : Duration.zero;
              return FractionallySizedBox(
                widthFactor: calculateValue(position, state.state.duration),
                child: Container(
                  decoration: theme.primaryStyle,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
