import 'package:screen_brightness/screen_brightness.dart';

class Brightness {
  Future<double> get systemBrightness async {
    try {
      return await ScreenBrightness().system;
    } catch (_) {
      return 0.0;
    }
  }

  Future<double> get currentBrightness async {
    try {
      return await ScreenBrightness().current;
    } catch (_) {
      return 0.0;
    }
  }

  Future<void> setBrightness(double brightness) async {
    try {
      await ScreenBrightness().setScreenBrightness(brightness);
    } catch (_) {}
  }
}
