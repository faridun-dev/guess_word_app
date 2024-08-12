import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MatchCard extends StatelessWidget {
  String word;
  String translation;
  int index;
  String letter;
  MatchCard({
    super.key,
    required this.word,
    required this.translation,
    required this.index,
    required this.letter,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 10,
        left: 10,
        right: 10,
      ),
      child: Container(
        padding: const EdgeInsets.all(
          10,
        ),
        decoration: const BoxDecoration(
          color: Colors.blue,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "$letter. $word",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
            ),
            Text(
              "$index. $translation",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
