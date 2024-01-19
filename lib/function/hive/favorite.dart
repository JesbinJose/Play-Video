import 'package:hive/hive.dart';

class FavouritesDataBase {
  FavouritesDataBase() {
    loadDB();
  }
  Box? box;
  //it is for loading the favourite data base
  Future<void> loadDB() async {
    box ??= await Hive.openBox<String>('favourit_db');
  }

  //it is for add video into a favorite
  Future<void> addVideo(String path) async {
    await box!.add(path);
  }

  //it is for checking if the video is already added to fav
  bool isPresent(String path) {
    return box!.values.contains(path);
  }

  //it is for getting the full favourite as a list<String>
  List<String> getFavLists() {
    return box!.values as List<String>;
  }

  //it is for removing from the favourites
  Future<void> remove(String path) async {
    await box!.delete(path);
  }
}
