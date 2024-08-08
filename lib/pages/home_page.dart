import 'package:flutter/material.dart';
import 'package:guess_word_app/components/game_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
          GameCard(title: "Learn Words 👨🏻‍🎓"),
          GameCard(title: "Guess Words 🤔"),
          GameCard(title: "Match Words 🎯"),
        ],
      ),
    );
  }
}
