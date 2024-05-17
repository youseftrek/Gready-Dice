import 'package:flutter/material.dart';
import 'package:greedy_dice_project/models/api_service_model.dart';
import 'package:greedy_dice_project/models/components/rounded_icon_button.dart';
import 'package:greedy_dice_project/models/game_model.dart';
import 'package:greedy_dice_project/models/components/roll_button.dart';
import 'package:greedy_dice_project/views/home_page.dart';

class ControlModel {
  late final RoundedIconButton _home;
  late final RoundedIconButton _restart;
  late final RoundedIconButton _hold;
  late final RollButton _rollButton;
  final GameModel _gameModel;
  ControlModel({required GameModel gameModel}) : _gameModel = gameModel {
    _intiHold();
    _intiHome();
    _intiRestart();
    _intiRollButton();
  }
  // update temp switch turn

  void _onTapHold() {
    _gameModel.holdScore();
    if (_gameModel.isWinner()) {
      _winner();
    } else {
      _gameModel.startTurn();
      _hold.unActive();
    }
  }

  void _winner() {
    if (_gameModel.getPlayersScore().isTurn()) {
      int score = _gameModel.player1.score + 10;
      String id = _gameModel.player1.id;
      APIServiceModel.updateUserScore(userId: id, score: score);
    } else {
      int score = _gameModel.player2.score + 10;
      String id = _gameModel.player2.id;
      APIServiceModel.updateUserScore(userId: id, score: score);
    }
  }

  void _onTapRollButton() {
    _pause();
    _gameModel.playAnimation();
    Future.delayed(const Duration(seconds: 1), () {
      _gameModel.rollDice();

      if (_gameModel.isOne()) {
        _endTurn();
      } else {
        _play();
      }
    });
  }

  void _onTapHome() {
  _home.openScreen(HomePage(user: _gameModel.player1,));
  }

  void _endTurn() {
    Future.delayed(const Duration(seconds: 1), () {
      _gameModel.startTurn();
      _rollButton.active();
      _restart.unActive();
    });
  }

  void _pause() {
    _hold.unActive();
    _rollButton.unActive();
  }

  void _play() {
    _hold.active();
    _rollButton.active();
  }

  void _onTapRestart() {
  }

  //Getter Methods
  RoundedIconButton getHoldButton() => _hold;
  RoundedIconButton getRestartButton() => _restart;
  RollButton getRollButton() => _rollButton;
  RoundedIconButton getHomeButton() => _home;
  GameModel getGameModel() => _gameModel;

  void _intiHold() {
    _hold = RoundedIconButton(
      onTap: _onTapHold,
      icon: const Icon(
        Icons.back_hand,
        size: 38,
        color: Color(0xff393E46),
      ),
      activation: false,
    );
  }

  void _intiHome() {
    _home = RoundedIconButton(
      onTap: _onTapHome,
      icon: const Icon(
        Icons.home,
        size: 38,
        color: Color(0xff393E46),
      ),
      activeColor: Colors.white,
      unActiveColor: const Color(0xff00ABB3),
    );
  }

  void _intiRestart() {
    _restart = RoundedIconButton(
      onTap: _onTapRestart,
      activation: false,
      icon: const Icon(
        Icons.repeat_rounded,
        size: 38,
        color: Color(0xff393E46),
      ),
    );
  }

  void _intiRollButton() {
    _rollButton = RollButton(onTap: _onTapRollButton, text: 'Roll Dice');
  }
}
