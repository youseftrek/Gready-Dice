import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:greedy_dice_project/models/control_model.dart';
import 'package:greedy_dice_project/models/components/roll_button.dart';

class GameBar extends StatelessWidget {
  GameBar({
    super.key,
    required this.controlModel,
  });
  final ControlModel controlModel;

  late final RollButton textButton;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18, right: 18, bottom: 32),
      child: Row(
        children: [
          controlModel.getRestartButton(),
          const Spacer(
            flex: 1,
          ),
          controlModel.getRollButton(),
          const Spacer(
            flex: 1,
          ),
          controlModel.getHomeButton(),
        ],
      ),
    );
  }
}
