import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/home_button.dart';
import '../widgets/home_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the screen width and height
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color(0xff222831),
      appBar: AppBar(
        backgroundColor: Color(0xff00ADB5),
        iconTheme: IconThemeData(
          color: Color(0xffEEEEEE),
          size: 35,
        ),
        elevation: 0,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.person_2))],
      ),
      drawer: HomeDrawer(
        name: "Abdelrahman gamgom",
        imageUrl: "https://i.pravatar.cc/500?img=6",
        score: "200",
        onTap: () {},
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
                    color: Color(0xffEEEEEE),
                    fontSize: screenWidth * 0.13,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'assets/fonts/Caveat-Regular.ttf',
                  ),
                  children: [
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
              onTap: () {},
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: screenHeight * 0.05),
            child: HomeButton(
              text: "Game Rules",
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}
