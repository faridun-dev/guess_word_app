import 'package:flutter/material.dart';
import 'package:guess_word_app/components/word_cord.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ScoresPage extends StatefulWidget {
  const ScoresPage({super.key});

  @override
  State<ScoresPage> createState() => _ScoresPageState();
}

class _ScoresPageState extends State<ScoresPage> {
  final _box = Hive.box("dataBase");

  @override
  Widget build(BuildContext context) {
    final data = _box.get("lesson_1");
    List words = data.keys.toList();

    return Scaffold(
      backgroundColor: Colors.blue[600],
      appBar: AppBar(
        title: const Text(
          "Table of Words: Lesson 1",
          style: TextStyle(
            fontSize: 26,
          ),
        ),
        centerTitle: true,
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 10,
          left: 10,
          right: 10,
        ),
        child: ListView.builder(
          itemBuilder: (context, index) {
            return WordCord(words: words, data: data, index: index);
          },
          itemCount: words.length,
        ),
      ),
    );
  }
}
