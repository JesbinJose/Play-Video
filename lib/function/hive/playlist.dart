import 'package:hive_flutter/hive_flutter.dart';

class PlayList {
  PlayList() {
    if (_box == null) throw 'You need to initlize it before using';
  }
  static Box? _box;
  //it is for loading data base
  static Future<void> init() async {
    try {
      await Hive.initFlutter();
    } catch (_) {}
    _box ??= await Hive.openBox('playlist_db');
  }

  //its for create playlist
  Future<void> addPlaylist(String playlistName, {List<String>? list}) async {
    await _box!.put(playlistName, list ?? []);
  }

  //delete playlist
  Future<void> deletePlaylist(String playlistName) async {
    await _box!.delete(playlistName);
  }

  //add video to playlist
  Future<void> addVideo(String path, String playlistName) async {
    final List<dynamic> list = _box!.get(playlistName);
    if (!list.contains(path)) {
      list.add(path);
      await _box!.put(playlistName, list);
    }
  }

  //remove video
  Future<void> removeVideo(String path, String playlistaName) async {
    final List<dynamic> list = _box!.get(playlistaName);
    list.remove(path);
    await _box!.put(playlistaName, list);
  }

  //get full data base as the playlist name and the videos in the playlist
  Map<String, List<String>> getFullPlaylist() {
    final List list = _box!.keys.toList();
    Map<String, List<String>> playlists = {};
    for (String playlistName in list) {
      // getting single by single whole playlists
      playlists[playlistName] = _box!.get(playlistName);
    }
    return playlists;
  }

  Future<void> deleteAVideoFromAllDataBase(String path) async {
    for (String playlistName in _box!.keys) {
      List list = _box!.get(playlistName);
      list.remove(path);
      await _box!.put(playlistName, list);
    }
  }
}
