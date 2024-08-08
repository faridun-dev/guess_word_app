import 'package:flutter/material.dart';
import 'package:guess_word_app/components/game_card.dart';
import 'package:guess_word_app/pages/learn_game.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void learnWords() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const LearnGame(),
      ),
    );
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
            onTap: () {},
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
