import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';

export 'package:media_kit/media_kit.dart';
export 'package:media_kit_video/media_kit_video.dart';

class VideoPlayerState {
  late VideoState _state;
  late VideoController _controller;
  VideoPlayerState({
    required VideoState state,
    required VideoController controller,
  }) {
    _state = state;
    _controller = controller;
    stream = controller.player.stream;
    this.state = controller.player.state;
  }
  late PlayerStream stream;
  late PlayerState state;
  Future<void> play() async => await _controller.player.play();
  Future<void> pause() async => await _controller.player.pause();
  Future<void> playOrPause() async => await _controller.player.playOrPause();
  Future<void> jump(int index) async => await _controller.player.jump(index);
  Future<void> move(int from, int to) async =>
      await _controller.player.move(from, to);
  Future<void> next() async => await _controller.player.next();
  Future<void> previous() async => await _controller.player.previous();
  Future<void> remove(int index) async =>
      await _controller.player.remove(index);
  Future<Uint8List?> screenshot() async =>
      await _controller.player.screenshot();
  Future<void> seek(Duration duration) async =>
      await _controller.player.seek(duration);
  Future<void> setAudioDevice(AudioDevice device) async =>
      await _controller.player.setAudioDevice(device);

  Future<void> setAudioTrack(AudioTrack track) async =>
      await _controller.player.setAudioTrack(track);

  Future<void> setPitch({double pitch = 1.0}) async =>
      await _controller.player.setPitch(pitch);
  Future<void> setPlayerMode(PlaylistMode mode) async {
    await _controller.player.setPlaylistMode(mode);
  }

  Future<void> setSpeed(double? speed) async =>
      await _controller.player.setRate(speed ?? 1.0);
  Future<void> setShuffle(bool shuffle) async =>
      await _controller.player.setShuffle(shuffle);
  Future<void> setSubtitleTrack(SubtitleTrack track) async =>
      await _controller.player.setSubtitleTrack(track);
  Future<void> setVideoTrack(VideoTrack track) async =>
      await _controller.player.setVideoTrack(track);
  Future<void> setVolume(double volume) async =>
      await _controller.player.setVolume(volume);

  Future<void> waitforFirstFrameRender() async =>
      await _controller.waitUntilFirstFrameRendered;

  Future<void> setSize({int? width, int? height}) async =>
      await _controller.setSize(
        height: height,
        width: width,
      );
  Future<void> enterFullScreen() async => await _state.enterFullscreen();
  Future<void> exitFullScreen() async => await _state.exitFullscreen();
  Future<void> toggleFullScreen() async => await _state.toggleFullscreen();
  void refreshView() => _state.refreshView();
  Future<AppExitResponse> didRequestAppExit() async =>
      await _state.didRequestAppExit();
  void update({
    double? width,
    double? height,
    BoxFit? fit,
    Color? fill,
    Alignment? alignment,
    double? aspectRatio,
    FilterQuality? filterQuality,
    Widget Function(VideoState)? controls,
    SubtitleViewConfiguration? subtitleViewConfiguration,
  }) async =>
      _state.update(
        width: width,
        height: height,
        fill: fill,
        fit: fit,
        filterQuality: filterQuality,
        alignment: alignment,
        aspectRatio: aspectRatio,
        controls: controls,
        subtitleViewConfiguration: subtitleViewConfiguration,
      );
}
