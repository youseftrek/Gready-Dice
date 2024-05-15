import 'package:flutter/material.dart';
import 'package:greedy_dice_project/views/login_screen.dart';
import 'package:greedy_dice_project/views/splash_screen.dart';


void main() {
  runApp(GreedyDice());
}

class GreedyDice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Rubik'),
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => SplashScreen(),
        '/login': (context) => LoginScreen()
      },
    );
  }
}
