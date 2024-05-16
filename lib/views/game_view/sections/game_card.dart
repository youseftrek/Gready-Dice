import 'package:flutter/material.dart';
import 'package:greedy_dice_project/models/control_model.dart';
import 'package:greedy_dice_project/models/game_model.dart';
import 'package:greedy_dice_project/widgets/game/col_row.dart';

class GameCard extends StatelessWidget {
  const GameCard({
    super.key,
    required this.controlModel,
  });

  final ControlModel controlModel;
  @override
  Widget build(BuildContext context) {
    final GameModel gameModel = controlModel.getGameModel();
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 50),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Stack(alignment: AlignmentDirectional.topStart, children: [
            // this layer one contain colunm of (containers that contain score in center )
            gameModel.getPlayersScore(),

            // this layer two contain players name , row of(tempScore , Dice , HoldButton)
            ColRow(
              nameOne: gameModel.getNameOne(),
              nameTwo: gameModel.getNameTwo(),
              tempScore: gameModel.getTempScore(),
              dice: gameModel.getDice(),
              holdButton: controlModel.getHoldButton(),
            ),
          ]),
        ),
      ),
    );
  }
}
