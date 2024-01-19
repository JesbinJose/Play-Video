import 'package:hive/hive.dart';

class PlayList {
  static Box? box;
  //it is for loading data base
  static Future<void> loadDB() async {
    box ??= await Hive.openBox('playlist_db');
  }

  //its for create playlist
  static Future<void> addPlaylist(String playlistName, {List<String>? list}) async {
    loadDB();
    await box!.put(playlistName, list ?? []);
  }

  //delete playlist
  static Future<void> deletePlaylist(String playlistName) async {
    loadDB();
    await box!.delete(playlistName);
  }

  //add video to playlist
  static Future<void> addVideo(String path, String playlistName) async {
    loadDB();
    final List<dynamic> list = box!.get(playlistName);
    if (!list.contains(path)) {
      list.add(path);
      await box!.put(playlistName, list);
    }
  }

  //remove video
  static Future<void> removeVideo(String path, String playlistaName) async {
    loadDB();
    final List<dynamic> list = box!.get(playlistaName);
    list.remove(path);
    await box!.put(playlistaName, list);
  }

  //get full data base as the playlist name and the videos in the playlist
  static Map<String, List<String>> getFullPlaylist() {
    loadDB();
    final List list = box!.keys.toList();
    Map<String, List<String>> playlists = {};
    for (String playlistName in list) {
      //getting single by single whole playlists
      playlists[playlistName] =box!.get(playlistName);
    }
    return playlists;
  }

  static Future<void> deleteAVideoFromAllDataBase(String path) async {
    loadDB();
    for (String playlistName in box!.keys) {
      List list = box!.get(playlistName);
      list.remove(path);
      await box!.put(playlistName, list);
    }
  }
}
