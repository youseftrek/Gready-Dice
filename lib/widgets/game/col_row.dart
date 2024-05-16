import 'package:flutter/material.dart';
import 'package:greedy_dice_project/models/components/rounded_icon_button.dart';
import 'package:greedy_dice_project/widgets/game/dice.dart';
import 'package:greedy_dice_project/widgets/game/game_control.dart';
import 'package:greedy_dice_project/widgets/game/temp_score.dart';

class ColRow extends StatelessWidget {
  ColRow({
    super.key,
    required this.nameOne,
    required this.nameTwo,
    required this.tempScore,
    required this.dice,
    required this.holdButton,
  });

  final String nameOne;
  final String nameTwo;
  final TempScore tempScore;
  final Dice dice;
  final RoundedIconButton holdButton;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // player 1 name
          Text(
            nameOne,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 32,
            ),
          ),

          const Spacer(
            flex: 1,
          ),
          // controls  counter -  dice - hold
          GameControl(holdButton: holdButton, dice: dice, tempScore: tempScore),

          const Spacer(
            flex: 1,
          ),
          // player 2 name
          Text(
            nameTwo,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 32,
            ),
          ),
        ],
      ),
    );
  }
}
