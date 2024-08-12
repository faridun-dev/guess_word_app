import 'dart:math';
import 'package:flutter/material.dart';
import 'package:guess_word_app/components/match_card.dart';
import 'package:hive_flutter/hive_flutter.dart';

class MatchGame extends StatefulWidget {
  const MatchGame({super.key});

  @override
  State<MatchGame> createState() => _MatchGameState();
}

class _MatchGameState extends State<MatchGame> {
  final _box = Hive.box("dataBase");
  List letters = ["A", "B", "C", "D"];
  TextEditingController aField = TextEditingController();
  TextEditingController bField = TextEditingController();
  TextEditingController cField = TextEditingController();
  TextEditingController dField = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final data = _box.get("lesson_1");
    List words = data.keys.toList();
    List translations = [];
    Random random = Random();
    List copyList = List.from(words);
    copyList.shuffle(random);

    List randomList = copyList.take(4).toList();
    for (var element in randomList) {
      translations.add(data[element][0]);
    }
    List randomTranslations = List.from(translations);
    randomTranslations.shuffle(random);


    return Scaffold(
      backgroundColor: Colors.blue[600],
      appBar: AppBar(
        title: const Text(
          "Game: Match Words",
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
            child: ListView.builder(
              itemCount: randomList.length,
              itemBuilder: (context, index) {
                return MatchCard(
                  word: randomList[index],
                  translation: randomTranslations[index],
                  index: index + 1,
                  letter: letters[index],
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 10,
              left: 10,
              right: 10,
            ),
            child: Row(
              children: [
                const Text(
                  "A. ",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                  ),
                ),
                Expanded(
                  child: TextFormField(
                    controller: aField,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 10,
              left: 10,
              right: 10,
            ),
            child: Row(
              children: [
                const Text(
                  "B. ",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                  ),
                ),
                Expanded(
                  child: TextFormField(
                    controller: bField,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 10,
              left: 10,
              right: 10,
            ),
            child: Row(
              children: [
                const Text(
                  "C. ",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                  ),
                ),
                Expanded(
                  child: TextFormField(
                    controller: cField,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 10,
              left: 10,
              right: 10,
            ),
            child: Row(
              children: [
                const Text(
                  "D. ",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                  ),
                ),
                Expanded(
                  child: TextFormField(
                    controller: dField,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 20,
              left: 10,
              right: 10,
            ),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
              onPressed: () {
                int correct = 0;
                int incorrect = 0;
                String a = aField.text;
                String b = bField.text;
                String c = cField.text;
                String d = dField.text;

                if (a == "" || b == "" || c == "" || d == "") {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text("Error"),
                        content: const Text("Please fill alll the entries!"),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text("Back"),
                          ),
                        ],
                      );
                    },
                  );
                } else {
                  if (data[randomList[0]][0] ==
                      randomTranslations[int.parse(a) - 1]) {
                    data[randomList[0]][1] += 1;
                    correct++;
                  } else {
                    incorrect++;
                  }

                  if (data[randomList[1]][0] ==
                      randomTranslations[int.parse(b) - 1]) {
                    data[randomList[1]][1] += 1;
                    correct++;
                  } else {
                    incorrect++;
                  }

                  if (data[randomList[2]][0] ==
                      randomTranslations[int.parse(c) - 1]) {
                    data[randomList[2]][1] += 1;
                    correct++;
                  } else {
                    incorrect++;
                  }

                  if (data[randomList[3]][0] ==
                      randomTranslations[int.parse(d) - 1]) {
                    data[randomList[3]][1] += 1;
                    correct++;
                  } else {
                    incorrect++;
                  }
                  _box.put("lesson_1", data);
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text("Result"),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "Correct: $correct",
                            ),
                            Text(
                              "Incorrect: $incorrect",
                            ),
                          ],
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                              Navigator.of(context).pop();
                            },
                            child: const Text("Quit"),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                              Navigator.of(context).pop();
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const MatchGame(),
                                ),
                              );
                            },
                            child: const Text("Try Again"),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              child: const Text(
                "SUBMIT",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
