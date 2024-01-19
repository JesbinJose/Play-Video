import 'package:hive_flutter/hive_flutter.dart';
import 'package:play_video/function/hive/history/adapter.dart';

class HistroyDataBase {
  HistroyDataBase() {
    if (_box == null) throw 'You need to initlize it before using';
  }
  static late Box? _box;

  /// Load the history data base
  Future<void> loadDB() async {
    try {
      await Hive.initFlutter();
      Hive.registerAdapter(HistoryAdapter());
    } catch (_) {}
    _box ??= await Hive.openBox<String>('history_db');
  }

  /// Add video to history
  Future<void> addVideo(HistoryAdapter video) async {
    await _box!.add(video);
  }

  /// Remove video from history
  Future<void> remove(String path) async {
    for (int i = 0; i < _box!.values.length; i++) {
      if (_box!.get(i).path == path) {
        await _box!.delete(i);
      }
    }
  }

  ///Get all History videos
  Future<List<HistoryAdapter>> getAllHistory() async {
    return _box!.values as List<HistoryAdapter>;
  }
}
