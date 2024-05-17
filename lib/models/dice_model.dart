import 'dart:math';

import 'package:flutter/material.dart';

class DiceModel {
  final List<ImageProvider> images = const [
    AssetImage('assets/images/animation.gif'),
    AssetImage('assets/images/1.png'),
    AssetImage('assets/images/2.png'),
    AssetImage('assets/images/3.png'),
    AssetImage('assets/images/4.png'),
    AssetImage('assets/images/5.png'),
    AssetImage('assets/images/6.png'),
    AssetImage('assets/images/winner.gif'),
  ];
  ImageProvider getAnimation() {
    return images[0];
  }

  ImageProvider getWinnerAnimation() {
    return images[7];
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
