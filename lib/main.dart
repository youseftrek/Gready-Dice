import 'package:flutter/material.dart';
import 'package:greedy_dice_project/views/leader_board.dart';

void main() {
  runApp(GreedyDice());
}

class GreedyDice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Inter'),
      debugShowCheckedModeBanner: false,
      home: LeaderBoard(),
    );
  }
}
