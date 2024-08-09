import 'package:flutter/material.dart';
import 'package:guess_word_app/components/game_card.dart';
import 'package:guess_word_app/pages/guess_game.dart';
import 'package:guess_word_app/pages/learn_game.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _box = Hive.box("dataBase");
  void learnWords() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const LearnGame(),
      ),
    );
  }

  void guessGame() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const GuessGame(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    if (!_box.containsKey("lesson_1")) {
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
      _box.put("lesson_1", lesson_1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[600],
      appBar: AppBar(
        title: const Text(
          "Words Game",
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
          GameCard(
            title: "Learn Words 👨🏻‍🎓",
            onTap: learnWords,
          ),
          GameCard(
            title: "Guess Words 🤔",
            onTap: guessGame,
          ),
          GameCard(
            title: "Match Words 🎯",
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
