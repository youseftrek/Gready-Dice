import 'package:flutter/material.dart';
import 'package:greedy_dice_project/views/game_rules.dart';
import 'package:greedy_dice_project/views/leader_board.dart';
import '../models/user_model.dart';
import '../widgets/home_button.dart';
import '../widgets/home_drawer.dart';

class HomePage extends StatelessWidget {
  final User user;
  const HomePage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    // Get the screen width and height
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xff222831),
      appBar: AppBar(
        backgroundColor: const Color(0xff00ADB5),
        iconTheme: const IconThemeData(
          color: Color(0xffEEEEEE),
          size: 35,
        ),
        elevation: 0,
      ),
      drawer: HomeDrawer(
        name: user.name,
        imageUrl: user.avatar,
        score: user.score.toString(),
        onTap: () {},
        LoggedInuser: user,
      ),
      body: Column(
        children: [
          SizedBox(height: screenHeight * 0.05),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              RichText(
                text: TextSpan(
                  style: TextStyle(
                    color: const Color(0xffEEEEEE),
                    fontSize: screenWidth * 0.13,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'assets/fonts/Caveat-Regular.ttf',
                  ),
                  children: const [
                    TextSpan(text: 'GR'),
                    TextSpan(
                      text: 'EE',
                      style: TextStyle(color: Color(0xff00ADB5)),
                    ),
                    TextSpan(text: 'DY '),
                    TextSpan(
                      text: 'D',
                      style: TextStyle(color: Color(0xff00ADB5)),
                    ),
                    TextSpan(text: 'ICE'),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: screenHeight * 0.1),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: Container(
                height: screenHeight * 0.3,
                width: screenWidth * 0.75,
                child: Image.asset('assets/images/dice.png'),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: screenHeight * 0.1),
            child: HomeButton(
              text: "PLAY",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => LeaderBoard(LoggedInuser: user)),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: screenHeight * 0.05),
            child: HomeButton(
              text: "Game Rules",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const GameRules()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
