import 'package:flutter/material.dart';

class TempScore extends StatefulWidget with CountTempScore {
  TempScore({
    super.key,
  });
  final _TempScoreState _tempScoreState = _TempScoreState();

  @override
  State<TempScore> createState() => _tempScoreState;

  @override
  int holdScore() => _tempScoreState.holdScore();

  @override
  void resetScore() => _tempScoreState.resetScore();

  @override
  void updateTempScore({required int result}) =>
      _tempScoreState.updateTempScore(result: result);
}

class _TempScoreState extends State<TempScore> with CountTempScore {
  late int counter;
  @override
  void initState() {
    super.initState();
    counter = 0;
  }

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      maxRadius: 28,
      backgroundColor: Colors.white,
      child: Text(
        '$counter',
        style: const TextStyle(
            color: Color(0xff393E46),
            fontSize: 32,
            fontWeight: FontWeight.bold),
      ),
    );
  }

  @override
  void updateTempScore({required int result}) {
    setState(() {
      counter = counter + result;
    });
  }

  @override
  void resetScore() {
    setState(() {
      counter = 0;
    });
  }

  @override
  int holdScore() {
    int points = counter;
    resetScore();
    return points;
  }
}

mixin CountTempScore {
  void resetScore();
  void updateTempScore({required int result});
  int holdScore();
}
