import 'package:flutter/material.dart';
import 'package:greedy_dice_project/models/components/rounded_icon_button.dart';
import 'package:greedy_dice_project/widgets/game/dice.dart';
import 'package:greedy_dice_project/widgets/game/temp_score.dart';

class GameControl extends StatelessWidget {
  const GameControl(
      {super.key,
      required this.holdButton,
      required this.dice,
      required this.tempScore});
  final Dice dice;
  final TempScore tempScore;
  final RoundedIconButton holdButton;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        // counter score
        tempScore,

        // dice
        dice,

        // hold button
        holdButton,
      ],
    );
  }
}
