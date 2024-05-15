import 'package:flutter/material.dart';
import 'views/Signup_Page.dart';

void main() {
  runApp(GreedyDice());
}

class GreedyDice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignupPage(),
    );
  }
}
