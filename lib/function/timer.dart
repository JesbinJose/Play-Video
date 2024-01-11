import 'dart:async';

import 'package:play_video/models/state.dart';

class Debouncer {
  Timer? _timer;
  final VideoPlayerState state;
  Debouncer({required this.state});

  void run() {
    state.showControls();
    _timer?.cancel();
    _timer = Timer(const Duration(seconds: 3), () => state.hideControls());
  }

  void dispose() {
    _timer?.cancel();
  }
}
