import 'package:flutter/material.dart';
import 'package:flutter_volume_controller/flutter_volume_controller.dart';

/// Volume
/// ------
///
/// [Volume] is for full control  on the audio
/// Don't works in web
class Volume {
  Volume({bool isMute = false}) {
    this.isMute().then((value) {
      if (value != isMute) {
        mute(isMute);
      } else {
        muteNotifier.value = isMute;
      }
    });
  }
  final ValueNotifier<bool> muteNotifier = ValueNotifier(true);

  /// Show or not system audio change bar when audio is changed
  Future<void> showVolumeUpdate(bool show) async {
    await FlutterVolumeController.updateShowSystemUI(show);
  }

  /// Get the current system or device volume
  Future<double?> getVolume() async {
    return await FlutterVolumeController.getVolume();
  }

  /// Set specific volume
  Future<void> setVolume(double volume) async {
    if (volume != 0&&!muteNotifier.value) muteNotifier.value = true;
    await FlutterVolumeController.setVolume(volume);
  }

  /// cheching that is it mute
  Future<bool?> isMute() async {
    return await FlutterVolumeController.getMute();
  }

  /// To control mute and unmute
  Future<void> mute(bool mute) async {
    await FlutterVolumeController.setMute(mute);
    muteNotifier.value = mute;
  }

  /// To toggle between mute and unmute
  Future<void> toggleMute() async {
    await FlutterVolumeController.toggleMute();
    muteNotifier.value = !muteNotifier.value;
  }
}
