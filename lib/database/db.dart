import 'package:hive_flutter/adapters.dart';

class DataBase {
  var box = Hive.box("dataBase");
  // final Map<String, List<dynamic>> lesson_1 = {
  //   "hello": ["привет", 0],
  //   "bye": ["пока", 0],
  // };

  void storeLesson(lessonKey, value) {
    box.put(lessonKey, value);
  }

  Map<String, List<dynamic>>? retrieveData(lessonKey) {
    return box.get(lessonKey);
  }
}
