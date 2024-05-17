import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:greedy_dice_project/models/api_service_model.dart';
import 'package:greedy_dice_project/views/game_view/game_view.dart';
import 'package:greedy_dice_project/widgets/utils.dart';
import '../models/user_model.dart';

void showPasswordDialog(BuildContext context, var user, User loggedUser) {
  final passwordController = TextEditingController();
  showDialog(
    context: context,
    builder: (BuildContext context) {
      String password = '';
      return AlertDialog(
        backgroundColor: const Color(0xff222831),
        title: const Text(
          'Opponent Password',
          style: TextStyle(color: Color(0xffEEEEEE)),
        ),
        content: TextFormField(
          style: const TextStyle(color: Color(0xffEEEEEE)),
          controller: passwordController,
          obscureText: true,
          onChanged: (value) {
            password = value;
          },
          decoration: const InputDecoration(
              hintText: 'Password',
              hintStyle: TextStyle(color: Color(0xffEEEEEE))),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Cancel',
                style: TextStyle(color: Color(0xff00ADB5))),
          ),
          TextButton(
            onPressed: () {
              bool verifyPassword = Utils.confirmPassword(
                  passwordController.text, user['password']);
              if (verifyPassword) {
                print(verifyPassword);
                User userObj = APIServiceModel.JsonToUser(user);
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => GameView(
                            player1: loggedUser,
                            player2: userObj,
                          )),
                );
              }
              // You can validate the password here

            },
            child: const Text(
              'Submit',
              style: TextStyle(color: Color(0xff00ADB5)),
            ),
          ),
        ],
      );
    },
  );
}
