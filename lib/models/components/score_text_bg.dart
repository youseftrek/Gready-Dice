import 'package:flutter/material.dart';

class ScoreTextBg extends StatelessWidget {
  const ScoreTextBg(
      {super.key,
      required this.score,
      required this.color,
      required this.isWin});

  final String score;
  final Color color;
  final bool isWin;

  @override
  Widget build(BuildContext context) {
    String text = (isWin) ? 'Winner!!' : score;
    Color bgColor = (isWin) ? const Color(0xff2E7D32) : color;

    return Container(
      decoration: BoxDecoration(
        color: bgColor,
      ),
      child: Center(
          child: Text(
        text,
        style: const TextStyle(
            color: Colors.white, fontSize: 64, fontWeight: FontWeight.bold),
      )),
    );
  }
}
