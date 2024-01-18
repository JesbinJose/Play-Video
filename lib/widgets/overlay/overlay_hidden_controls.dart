
import 'package:flutter/material.dart';
import 'package:play_video/function/brightness.dart';
import 'package:play_video/function/timer.dart';
import 'package:play_video/models/state.dart';

class OverlayHiddenControls extends StatelessWidget {
  const OverlayHiddenControls({
    super.key,
    required this.state,
    required this.d,
  });

  final VideoPlayerState state;
  final Debouncer d;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: state.height,
      width: state.width,
      child: StreamBuilder(
        stream: state.stream.position,
        builder: (context, snapshot) {
          return GestureDetector(
            onTap: () => d.run(),
            onDoubleTapDown: (details) {
              final widthPart =
                  MediaQuery.sizeOf(context).width / 4;
              final duration = snapshot.data?.inSeconds ?? 0;
              if (details.localPosition.dx < widthPart) {
                state.seek(
                  Duration(
                    seconds: duration > 10 ? duration - 10 : 0,
                  ),
                );
              } else if (details.localPosition.dx > widthPart * 3) {
                state.seek(
                  Duration(
                    seconds: duration + 10,
                  ),
                );
              } else {
                state.playOrPause();
              }
            },
            onVerticalDragUpdate: (details) async{
              if (details.localPosition.dx <
                  MediaQuery.sizeOf(context).width / 2) {
                final movement = ((details.localPosition.dy / 0.9) /
                        context.size!.height)
                    .clamp(0, 1.0);
                await setBrightness(1 - movement.toDouble());
              } else {
                final movement = ((details.localPosition.dy / 0.9) /
                        context.size!.height)
                    .clamp(0, 1.0);
                await state.setVolume(100 - movement * 100);
              }
            },
            onHorizontalDragUpdate: (details) {
              if (!state.isPlaying) state.play();
              final newValue =
                  (details.localPosition.dx / context.size!.width)
                      .clamp(0.0, 1.0);
              final seekTo =
                  newValue * state.state.duration.inMilliseconds;
              state.seek(Duration(milliseconds: seekTo.toInt()));
            },
          );
        },
      ),
    );
  }
}
