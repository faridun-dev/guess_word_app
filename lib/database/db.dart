import 'package:hive_flutter/adapters.dart';

class DataBase {
  var box = Hive.box("dataBase");
  final Map<String, List<dynamic>> lesson_1 = {
    "hello": ["привет", 0],
    "bye": ["пока", 0],
  };

  void storeLesson() {
    box.put("lesson_1", lesson_1);
  }

  Map<String, List<dynamic>>? retrieveData() {
    return box.get("lesson_1");
  }
}
