import 'package:greedy_dice_project/models/dice_model.dart';
import 'package:greedy_dice_project/models/user_model.dart';
import 'package:greedy_dice_project/widgets/game/dice.dart';
import 'package:greedy_dice_project/widgets/game/players_score.dart';
import 'package:greedy_dice_project/widgets/game/temp_score.dart';

class GameModel {
  final User player1;
  final User player2;
  final DiceModel _diceModel = DiceModel();
  final TempScore _tempScore = TempScore();
  final Dice _dice = Dice();
  final PlayersScore _playersScore = PlayersScore();
  bool _isWinner = false;
  bool _isOne = false;
  
  GameModel({
    required this.player1,required this.player2,
});

  void playAnimation() =>
      _dice.playAnimation(animation: _diceModel.getAnimation());
  void rollDice() {
    _dice.displayResult(result: _diceModel.rollDice());
    _updateTempScore();
  }

  void startTurn() {
    _dice.restart();
    _playersScore.startTurn();
  }

// this method use with  hold button
  void holdScore() {
    int points = _tempScore.holdScore();
    // this method update score and return current score
    int currentScore = _playersScore.updateScore(points: points);
    _isWinner = (currentScore >= 20);
  }

  bool isWinner() => _isWinner;

  void _updateTempScore() {
    int result = _diceModel.getNum();
    _isOne = (result == 1);
    if (_isOne) {
      _tempScore.resetScore();
    } else {
      _tempScore.updateTempScore(result: result);
    }
  }

  bool isOne() => _isOne;
  String getNameOne() => player1.name;
  String getNameTwo() => player2.name;
  DiceModel getDiceModel() => _diceModel;
  TempScore getTempScore() => _tempScore;
  Dice getDice() => _dice;
  PlayersScore getPlayersScore() => _playersScore;
}
