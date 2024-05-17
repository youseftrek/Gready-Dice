import 'package:flutter/material.dart';
import 'package:greedy_dice_project/models/components/score_text_bg.dart';

class PlayersScore extends StatefulWidget with UpdateState {
  PlayersScore({super.key});
  final _PlayersScoreState _playersScoreState = _PlayersScoreState();

  @override
  // ignore: no_logic_in_create_state
  State<PlayersScore> createState() => _playersScoreState;
  @override
  int updateScore({required int points}) =>
      _playersScoreState.updateScore(points: points);

  @override
  void startTurn() => _playersScoreState.startTurn();

  bool isTurn() {
    return _playersScoreState._isMyTurn;
  }

  @override
  void win() {
    _playersScoreState.win();
  }

  @override
  void restart() {
    _playersScoreState.restart();
  }
}

class _PlayersScoreState extends State<PlayersScore> with UpdateState {
  late int _scoreOne;
  late int _scoreTwo;
  late bool _isMyTurn;
  late bool _isOneWinner;
  late bool _isTwoWinner;
  late final Color _activeColor;

  late final Color _disactiveColor;
  @override
  void initState() {
    super.initState();
    _activeColor = const Color(0xff6CCCD1);

    _disactiveColor = const Color(0xff393e46);
    _scoreOne = 0;
    _scoreTwo = 0;
    _isMyTurn = true;
    _isOneWinner = false;
    _isTwoWinner = false;
  }

  @override
  Widget build(BuildContext context) {
    final Color playerOneColor = _isMyTurn ? _activeColor : _disactiveColor;
    final Color playerTwoColor = !_isMyTurn ? _activeColor : _disactiveColor;

    return Column(
      children: [
        Expanded(
            child: ScoreTextBg(
          score: '$_scoreOne',
          color: playerOneColor,
          isWin: _isOneWinner,
        )),
        Expanded(
            child: ScoreTextBg(
          score: '$_scoreTwo',
          color: playerTwoColor,
          isWin: _isTwoWinner,
        )),
      ],
    );
  }

  @override
  int updateScore({required int points}) {
    if (_isMyTurn) {
      setState(() {
        _scoreOne += points;
      });
      return _scoreOne;
    } else {
      setState(() {
        _scoreTwo += points;
      });
      return _scoreTwo;
    }
  }

  @override
  void startTurn() {
    setState(() {
      _isMyTurn = !_isMyTurn;
    });
  }

  @override
  void win() {
    setState(() {
      _isOneWinner = _isMyTurn;
      _isTwoWinner = !_isMyTurn;
    });
  }

  @override
  void restart() {
    setState(() {
      _scoreOne = 0;
      _scoreTwo = 0;
      _isMyTurn = true;
      _isOneWinner = false;
      _isTwoWinner = false;
    });
  }
}

mixin UpdateState {
  void startTurn();
  int updateScore({required int points});
  void win();
  void restart();
}
