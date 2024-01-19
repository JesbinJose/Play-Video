import 'package:hive/hive.dart';
part 'adapter.g.dart';

@HiveType(typeId: 1)
class History {
  @HiveField(0)
  int number;

  @HiveField(1)
  Duration time;

  @HiveField(2)
  String path;

  History({required this.number, required this.time,required this.path});
}
