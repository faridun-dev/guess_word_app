import 'package:flutter/material.dart';

// ignore: must_be_immutable
class GameCard extends StatelessWidget {
  String title;
  Function()? onTap;
  GameCard({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(
          top: 20,
          left: 20,
          right: 20,
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(
              12,
            ),
          ),
          padding: const EdgeInsets.all(
            40,
          ),
          width: double.infinity,
          child: Center(
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 23,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
