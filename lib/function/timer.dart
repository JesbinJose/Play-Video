import 'dart:async';

import 'package:play_video/models/state.dart';

class Debouncer {
  Timer? _timer;
  final VideoPlayerState state;
  Debouncer({required this.state});
  static Duration duration = const Duration(seconds: 5);

  void run() {
    state.showControls();
    _timer?.cancel();
    _timer = Timer(duration, () => state.hideControls());
  }

  void dispose() {
    _timer?.cancel();
    state.hideControls();
  }
}
