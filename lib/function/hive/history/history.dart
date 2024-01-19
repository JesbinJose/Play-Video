import 'package:hive_flutter/hive_flutter.dart';
import 'package:play_video/function/hive/history/adapter.dart';

class HistroyDataBase {
  HistroyDataBase() {
    loadDB();
  }
  Box? box;

  /// Load the history data base
  Future<void> loadDB() async {
    try {
      await Hive.initFlutter();
      Hive.registerAdapter(HistoryAdapter());
    } catch (_) {}
    box ??= await Hive.openBox<String>('history_db');
  }

  /// Add video to history
  Future<void> addVideo(HistoryAdapter video) async {
    await box!.add(video);
  }

  /// Remove video from history
  Future<void> remove(String path) async {
    for (int i = 0; i < box!.values.length; i++) {
      if (box!.get(i).path == path) {
        await box!.delete(i);
      }
    }
  }

  ///Get all History videos
  Future<List<HistoryAdapter>> getAllHistory() async {
    return box!.values as List<HistoryAdapter>;
  }
}
