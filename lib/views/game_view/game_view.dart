import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:greedy_dice_project/models/control_model.dart';
import 'package:greedy_dice_project/models/game_model.dart';
import 'package:greedy_dice_project/views/game_view/sections/game_bar.dart';
import 'package:greedy_dice_project/views/game_view/sections/game_card.dart';

import '../../models/user_model.dart';

class GameView extends StatelessWidget {
  final User player1;
  final User player2;
  GameView({super.key, required this.player1, required this.player2});

  @override
  Widget build(BuildContext context) {
    final ControlModel controlModel =
        ControlModel(gameModel: GameModel(player1: player1, player2: player2));
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: const Color(0xff1F252E),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GameCard(
            controlModel: controlModel,
          ),
          GameBar(
            controlModel: controlModel,
          ),
        ],
      ),
    );
  }
}
