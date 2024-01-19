import 'package:hive_flutter/hive_flutter.dart';

class PlayList {
  PlayList() {
    loadDB();
  }
  Box? box;
  //it is for loading data base
  Future<void> loadDB() async {
    try {
      await Hive.initFlutter();
    } catch (_) {}
    box ??= await Hive.openBox('playlist_db');
  }

  //its for create playlist
  Future<void> addPlaylist(String playlistName, {List<String>? list}) async {
    await box!.put(playlistName, list ?? []);
  }

  //delete playlist
  Future<void> deletePlaylist(String playlistName) async {
    await box!.delete(playlistName);
  }

  //add video to playlist
  Future<void> addVideo(String path, String playlistName) async {
    final List<dynamic> list = box!.get(playlistName);
    if (!list.contains(path)) {
      list.add(path);
      await box!.put(playlistName, list);
    }
  }

  //remove video
  Future<void> removeVideo(String path, String playlistaName) async {
    final List<dynamic> list = box!.get(playlistaName);
    list.remove(path);
    await box!.put(playlistaName, list);
  }

  //get full data base as the playlist name and the videos in the playlist
  Map<String, List<String>> getFullPlaylist() {
    final List list = box!.keys.toList();
    Map<String, List<String>> playlists = {};
    for (String playlistName in list) {
      //getting single by single whole playlists
      playlists[playlistName] = box!.get(playlistName);
    }
    return playlists;
  }

  Future<void> deleteAVideoFromAllDataBase(String path) async {
    for (String playlistName in box!.keys) {
      List list = box!.get(playlistName);
      list.remove(path);
      await box!.put(playlistName, list);
    }
  }
}
