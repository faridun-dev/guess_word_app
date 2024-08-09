import 'package:flutter/material.dart';
import 'package:guess_word_app/database/db.dart';

class LearnGame extends StatefulWidget {
  const LearnGame({super.key});

  @override
  State<LearnGame> createState() => _LearnGameState();
}

class _LearnGameState extends State<LearnGame> {
  final db = DataBase();

  @override
  void initState() {
    super.initState();
    final Map<String, List<dynamic>> lesson_1 = {
      "hello": ["привет", 0],
      "bye": ["пока", 0],
    };
    db.storeLesson("lesson_1", lesson_1);
  }

  @override
  Widget build(BuildContext context) {
    final data = db.retrieveData("lesson_1");
    List words = [];
    List translations = [];
    for (var i = 0; i < data!.length; i++) {
      words.add(data.keys.elementAt(i));
    }
    for (var i = 0; i < data.length; i++) {
      translations.add(data.values.elementAt(i));
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
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    data.keys.elementAt(0),
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
                    data["hello"]![0],
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
            onPressed: () {},
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
      ),
    );
  }
}
