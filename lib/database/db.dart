import 'package:hive_flutter/adapters.dart';

class DataBase {
  var box = Hive.box("dataBase");

  void storeLesson(lessonKey, value) {
    box.put(lessonKey, value);
  }

  Map<String, List<dynamic>>? retrieveData(lessonKey) {
    return box.get(lessonKey);
  }

  void initialData() {
    final Map<String, List<dynamic>> lesson_1 = {
      "hello": ["привет", 0],
      "bye": ["пока", 0],
      "thank you": ["спасибо", 0],
      "please": ["пожалуйста", 0],
      "yes": ["да", 0],
      "no": ["нет", 0],
      "good morning": ["доброе утро", 0],
      "good night": ["спокойной ночи", 0],
      "how are you?": ["как дела?", 0],
      "I'm fine": ["я в порядке", 0],
      "excuse me": ["извините", 0],
      "sorry": ["прости", 0],
      "what's your name?": ["как тебя зовут?", 0],
      "my name is...": ["меня зовут...", 0],
      "where is...?": ["где...?", 0],
      "how much?": ["сколько?", 0],
      "I don't understand": ["я не понимаю", 0],
      "help": ["помощь", 0],
      "stop": ["остановись", 0],
      "water": ["вода", 0],
    };
    box.put("lesson_1", lesson_1);
  }
}
