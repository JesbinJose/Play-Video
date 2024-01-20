import 'package:play_video/function/hive/favorite.dart';
import 'package:play_video/function/hive/history/history.dart';
import 'package:play_video/function/hive/playlist.dart';

class PlayVideoRender {
  static Future<void> init() async {
    await FavouritesDataBase.init();
    await HistroyDataBase.init();
    await PlayList.init();
  }
}
