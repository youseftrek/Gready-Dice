import 'package:flutter/material.dart';
import 'package:greedy_dice_project/models/dice_model.dart';
import 'package:greedy_dice_project/models/game_model.dart';

class Dice extends StatefulWidget with roll {
  Dice({
    super.key,
  });
  final _DiceState _diceState = _DiceState();
  @override
  State<Dice> createState() => _diceState;

  @override
  void displayResult({required ImageProvider<Object> result}) {
    _diceState.displayResult(result: result);
  }

  @override
  void playAnimation({required ImageProvider<Object> animation}) {
    _diceState.playAnimation(animation: animation);
  }

  @override
  void restart() {
    _diceState.restart();
  }
}

class _DiceState extends State<Dice> with roll {
  late ImageProvider image;
  final ImageProvider defaultImage =
      const AssetImage('assets/images/dice/start.png');
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    image = defaultImage;
  }

  @override
  void playAnimation({required ImageProvider animation}) {
    setState(() {
      image = animation;
    });
  }

  @override
  void displayResult({required ImageProvider result}) {
    setState(() {
      image = result;
    });
  }

  @override
  void restart() {
    setState(() {
      image = defaultImage;
    });
  }

  void rollingDice(
      {required DiceModel diceModel, required GameModel gameModel}) {
    playAnimation(animation: diceModel.getAnimation());

    Future.delayed(const Duration(seconds: 1), () {
      displayResult(result: diceModel.rollDice());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 120,
      decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(0),
          image: DecorationImage(
            image: image,
            fit: BoxFit.cover,
          )),
    );
  }
}

mixin roll {
  void playAnimation({required ImageProvider animation});

  void displayResult({required ImageProvider result});

  void restart();
}
