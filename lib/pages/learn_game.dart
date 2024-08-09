import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class LearnGame extends StatefulWidget {
  const LearnGame({super.key});

  @override
  State<LearnGame> createState() => _LearnGameState();
}

class _LearnGameState extends State<LearnGame> {
  final _box = Hive.box("dataBase");

  int currentIndex = 0;
  bool question = true;

  @override
  Widget build(BuildContext context) {
    final data = _box.get("lesson_1");
    List words = data!.keys.toList();
    List translations = data.values.toList();

    void nextWord() {
      setState(() {
        currentIndex++;
        question = true;
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
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        question = !question;
                      });
                    },
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
                            question ? "?" : translations[currentIndex][0],
                            style: const TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                            ),
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
