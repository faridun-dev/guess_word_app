import 'package:flutter/material.dart';
import 'package:guess_word_app/database/db.dart';

class GuessGame extends StatefulWidget {
  const GuessGame({super.key});

  @override
  State<GuessGame> createState() => _GuessGameState();
}

class _GuessGameState extends State<GuessGame> {
  bool question = true;
  final db = DataBase();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final data = db.retrieveData("lesson_1");

    List words = data!.keys.toList();
    List translations = data.values.toList();

    void nextPair() {
      setState(() {
        currentIndex++;
        question = true;
      });
    }

    void updateScore(String word, bool isCorrect) {
      if (data.containsKey(word)) {
        int currentScore = data[word]![1];
        if (isCorrect) {
          currentScore++;
        }
        data[word]![1] = currentScore;

        db.storeLesson("lesson_1", data);
      }
    }

    return Scaffold(
      backgroundColor: Colors.blue[600],
      appBar: AppBar(
        title: const Text(
          "Game: Guess Words",
          style: TextStyle(
            fontSize: 26,
          ),
        ),
        centerTitle: true,
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
              ),
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.blue,
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
                  decoration: const BoxDecoration(
                    color: Colors.blue,
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.white,
                  minimumSize: const Size(
                    150,
                    50,
                  ),
                ),
                onPressed: () {
                  updateScore(words[currentIndex], true);
                  nextPair();
                },
                child: const Text(
                  "CORRECT",
                  style: TextStyle(
                    color: Colors.green,
                  ),
                ),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.white,
                  minimumSize: const Size(
                    150,
                    50,
                  ),
                ),
                onPressed: () {
                  updateScore(words[currentIndex], false);
                  nextPair();
                },
                child: const Text(
                  "INCORRECT",
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
