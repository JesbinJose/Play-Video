import 'package:flutter/material.dart';
import 'package:play_video/function/timer.dart';
import 'package:play_video/models/state.dart';

double _time = 0;

class DefaultProgressBar extends StatelessWidget {
  final VideoPlayerState state;
  final Debouncer debouncer;
  const DefaultProgressBar({
    super.key,
    required this.state,
    required this.debouncer,
  });

  double _calculateValue(Duration position, Duration duration) {
    if (position == Duration.zero) return _time;
    _time = position.inMilliseconds / duration.inMilliseconds;
    return _time;
  }

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
          child: StreamBuilder<Duration>(
            stream: state.stream.position,
            builder: (context, snapshot) {
              final position =
                  snapshot.data != null ? snapshot.data! : Duration.zero;
              final value = _calculateValue(position, state.state.duration);
              return LinearProgressIndicator(
                minHeight: 5,
                value: value,
              );
            },
          ),
        ),
      ),
    );
  }
}
