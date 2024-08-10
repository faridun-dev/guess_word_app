import 'package:flutter/material.dart';

// ignore: must_be_immutable
class WordCord extends StatelessWidget {
  List words;
  // ignore: prefer_typing_uninitialized_variables
  final data;
  int index;

  WordCord({
    super.key,
    required this.words,
    required this.data,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 5,
      ),
      child: Container(
        padding: const EdgeInsets.only(
          top: 8,
          bottom: 8,
          left: 13,
          right: 13,
        ),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              words[index],
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            Text(
              data[words[index]][1].toString(),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
