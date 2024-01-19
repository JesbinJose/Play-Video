import 'package:hive_flutter/hive_flutter.dart';

class FavouritesDataBase {
  FavouritesDataBase() {
    if (_box == null) throw 'You need to initlize it before using';
  }
  static Box? _box;
  //it is for loading the favourite data base
  static Future<void> init() async {
    try {
      await Hive.initFlutter();
    } catch (_) {}
    _box ??= await Hive.openBox<String>('favourit_db');
  }

  //it is for add video into a favorite
  Future<void> addVideo(String path) async {
    await _box!.add(path);
  }

  //it is for checking if the video is already added to fav
  bool isFav(String path) {
    return _box!.values.contains(path);
  }

  //it is for getting the full favourite as a list<String>
  getFavLists() {
    return _box!.values;
  }

  //it is for removing from the favourites
  Future<void> remove(String path) async {
    final int index = _box!.values.toList().indexOf(path);
    await _box!.deleteAt(index);
  }
}
