import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';
import 'package:play_video/models/methods.dart';

export 'package:media_kit/media_kit.dart';
/// [VideoPlayerState] is the state of the Video , player.
/// Control every thing , Get all updates From this [state] and [stream]
class VideoPlayerState extends UIOperations {
  late VideoState _state;
  late VideoController _controller;
  late Player _player;
  VideoPlayerState({
    required VideoState state,
    required VideoController controller,
    required this.height,
    required this.width,
  }) : super(
          isPlaying: controller.player.state.playing,
        ) {
    _state = state;
    _controller = controller;
    stream = controller.player.stream;
    this.state = controller.player.state;
    _player = _controller.player;
  }

  /// Height of the Player
  final double height;

  /// Width of the Player
  final double width;

  /// Player Stream
  /// ------------
  /// Event [Stream]s for subscribing to [Player] events.
  late PlayerStream stream;

  /// Player State
  /// ------------
  /// State of the Player
  late PlayerState state;

  /// Start Playing video or videos
  Future<void> play() async {
    isPlay.value = true;
    await _player.play();
  }

  /// Pause video
  Future<void> pause() async {
    isPlay.value = false;
    await _player.pause();
  }

  /// For changing state between play and pause
  ///
  /// if(video is playing) then it will pause
  ///
  /// if(video is in pause state) then it will start playing
  Future<void> playOrPause() async {
    isPlay.value = !isPlay.value;
    await _player.playOrPause();
  }

  /// It is for navigating between videos .
  ///
  /// It only workes if you're using multiple videos
  ///
  /// [jump(index)] index is the index of the next video which you want to play
  Future<void> jump(int index) async => await _player.jump(index);

  /// Moves form index to to index
  ///
  /// moves(from,to)
  ///
  /// from and to are index that is spesified to move
  Future<void> move(int from, int to) async => await _player.move(from, to);

  /// Skip the current video
  Future<void> next() async => await _player.next();

  /// play the previously played video
  Future<void> previous() async => await _player.previous();

  /// remove video from the given list of videos by index
  Future<void> remove(int index) async => await _player.remove(index);

  /// Take a screenshot of the current frame of the video
  ///
  /// The return value is Uint8List?
  Future<Uint8List?> screenshot() async {
    return await _player.screenshot();
  }

  /// For seeking the current playing video to specific duration
  ///
  /// seek(duration) the duration is the time that need to seek
  Future<void> seek(Duration duration) async => await _player.seek(duration);

  /// To change the Audio Device
  ///
  /// Use the [PlayerState] to get all audio devices from this controller then
  /// you can select a [AudioDevice] and pass through the function.
  Future<void> setAudioDevice(AudioDevice device) async =>
      await _player.setAudioDevice(device);

  /// To setting a audio track for the current playing video
  ///
  /// ```dart
  /// setAudioTrack(
  ///   AudioTrack.uri(
  ///     'url',
  ///     title: 'title',
  ///     language: 'lg',
  ///   ),
  /// );
  /// ```
  Future<void> setAudioTrack(AudioTrack track) async =>
      await _player.setAudioTrack(track);

  /// Sets a relative pitch tp the player
  ///
  ///  ```dart
  /// setPitch(pitch:1.0);
  /// ```
  Future<void> setPitch(double pitch) async => await _player.setPitch(pitch);

  /// For setting PlayerModes Use [PlaylistMode] as argument
  ///
  /// ```dart
  /// // Loop all the videos and after finishing all videos start from first
  /// setPlayerMode(PlayListMode.none);
  /// // Stop playing video after all the videos are played
  /// setPlayerMode(PlayListMode.loop);
  /// // Loop only the current video
  /// setPlayerMode(PlayListMode.loop);
  /// ```
  Future<void> setPlayerMode(PlaylistMode mode) async =>
      await _player.setPlaylistMode(mode);

  /// For setting a playback speed
  ///
  /// ```dart
  /// setSpeed(1.0);// provide playback speed in double
  /// ```
  Future<void> setSpeed(double speed) async => await _player.setRate(speed);

  /// Enable or Disable the shuffle Default `false`.
  Future<void> setShuffle(bool shuffle) async =>
      await _player.setShuffle(shuffle);

  /// Set a subtitle to current video
  ///
  /// ```dart
  /// setSubtitleTrack(
  ///   SubtitleTrack.uri(
  ///     'https://www.iandevlin.com/html5test/webvtt/upc-video-subtitles-en.vtt',
  ///     title: 'English',
  ///     language: 'en',
  ///   ),
  /// );
  /// ```
  Future<void> setSubtitleTrack(SubtitleTrack track) async =>
      await _player.setSubtitleTrack(track);

  /// Set a subtitle to current video
  ///
  /// ```dart
  /// setVideoTrack(VideoTrack.auto()); // Selecting the first VideoTrack
  /// setVideoTrack(VideoTrack.no()); // For disabling the VideoTrack
  /// ```
  Future<void> setVideoTrack(VideoTrack track) async =>
      await _player.setVideoTrack(track);

  /// Set a specific persentage of volume .Default: `100.0`
  ///
  /// ```dart
  /// setVolume(50); // pass the value in percentage 0 - 100
  /// ```
  ///
  Future<void> setVolume(double volume) async =>
      await _player.setVolume(volume);

  /// It will only compelete when first frame of the video is rendered
  Future<void> waitforFirstFrameRender() async =>
      await _controller.waitUntilFirstFrameRendered;

  /// Set a different size to the videoplayer
  ///
  /// May lack in perfomance
  Future<void> setSize({int? width, int? height}) async =>
      await _controller.setSize(
        height: height,
        width: width,
      );

  /// To enter full screen Video player
  Future<void> enterFullScreen() async => await _state.enterFullscreen();

  /// To exit full screen Video player
  Future<void> exitFullScreen() async => await _state.exitFullscreen();

  /// To toggle full screen Video player
  Future<void> toggleFullScreen() async => await _state.toggleFullscreen();

  /// Refresh View
  void refreshView() => _state.refreshView();

  /// It is for controlling the exit try
  ///
  ///  [AppExitResponse.cancel] Cancel the exiting process don't try to exit
  ///
  ///  [AppExitResponse.exit] Exiting the app can be done
  Future<AppExitResponse> didRequestAppExit() async =>
      await _state.didRequestAppExit();

  /// For updating the player settings during the playing time
  ///
  /// Type : `update({ double? width, double? height, BoxFit? fit, Color? fill,
  ///  Alignment? alignment, double? aspectRatio, FilterQuality? filterQuality})`
  void update({
    double? width,
    double? height,
    BoxFit? fit,
    Color? fill,
    Alignment? alignment,
    double? aspectRatio,
    FilterQuality? filterQuality,
  }) async =>
      _state.update(
        width: width,
        height: height,
        fill: fill,
        fit: fit,
        filterQuality: filterQuality,
        alignment: alignment,
        aspectRatio: aspectRatio,
      );

  void dispose() {
    lockNotifier.dispose();
    overlayOpacityNotifier.dispose();
    moreOpacityNotifier.dispose();
    isPlay.dispose();
    _state.dispose();
  }
}
