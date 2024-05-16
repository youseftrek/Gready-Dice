import 'package:flutter/material.dart';

class ScoreTextBg extends StatelessWidget {
  const ScoreTextBg({
    super.key,
    required this.score,
    required this.color,
  });

  final String score;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
      ),
      child: Center(
          child: Text(
        score,
        style: const TextStyle(
            color: Colors.white, fontSize: 64, fontWeight: FontWeight.bold),
      )),
    );
  }
}
