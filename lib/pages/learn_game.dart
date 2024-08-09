import 'package:flutter/material.dart';
import 'package:guess_word_app/database/db.dart';

class LearnGame extends StatefulWidget {
  const LearnGame({super.key});

  @override
  State<LearnGame> createState() => _LearnGameState();
}

class _LearnGameState extends State<LearnGame> {
  final db = DataBase();
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
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
    db.storeLesson("lesson_1", lesson_1);
  }

  @override
  Widget build(BuildContext context) {
    final data = db.retrieveData("lesson_1");
    List words = data!.keys.toList();
    List translations = data.values.toList();

    void nextWord() {
      setState(() {
        currentIndex++;
      });
    }

    return Scaffold(
      backgroundColor: Colors.blue[600],
      appBar: AppBar(
        title: const Text(
          "Game: Learn Words",
          style: TextStyle(
            fontSize: 26,
          ),
        ),
        centerTitle: true,
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue,
      ),
      body: currentIndex < words.length
          ? Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 20,
                      left: 20,
                      right: 20,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text(
                          words[currentIndex],
                          style: const TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 20,
                      left: 20,
                      right: 20,
                      bottom: 20,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text(
                          translations[currentIndex][0],
                          style: const TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.white,
                    minimumSize: const Size(
                      200,
                      50,
                    ),
                  ),
                  onPressed: nextWord,
                  child: const Text(
                    "NEXT",
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            )
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Lesson is over 👌🏻",
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.white,
                      minimumSize: const Size(
                        200,
                        50,
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        currentIndex = 0;
                      });
                    },
                    child: const Text(
                      "AGAIN",
                      style: TextStyle(
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
