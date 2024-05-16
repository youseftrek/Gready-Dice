import 'dart:math';

import 'package:flutter/material.dart';

class DiceModel {
  final List<ImageProvider> images = const [
    AssetImage('assets/images/dice/animation.gif'),
    AssetImage('assets/images/dice/1.png'),
    AssetImage('assets/images/dice/2.png'),
    AssetImage('assets/images/dice/3.png'),
    AssetImage('assets/images/dice/4.png'),
    AssetImage('assets/images/dice/5.png'),
    AssetImage('assets/images/dice/6.png'),
  ];
  ImageProvider getAnimation() {
    return images[0];
  }

  Random random = Random();
  int _num = 0;

  ImageProvider rollDice() {
    _num = random.nextInt(6) + 1;
    print(_num);
    return images[_num];
  }

  int getNum() => _num;
}
