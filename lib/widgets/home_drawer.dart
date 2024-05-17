import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:greedy_dice_project/views/leader_board.dart';

import '../models/user_model.dart';
import 'home_button.dart';

class HomeDrawer extends StatelessWidget {
  final User LoggedInuser;
  const HomeDrawer(
      {super.key,
      required this.name,
      required this.imageUrl,
      required this.score,
      required this.onTap, required this.LoggedInuser});
  final String name;
  final String imageUrl;
  final String score;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xff393E46),
      child: Column(
        children: [
          DrawerHeader(
            child: CircleAvatar(
              backgroundImage: NetworkImage(imageUrl),
              radius: 80,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25),
            child: Text(
              name,
              style: const TextStyle(
                  color: Color(0xffEEEEEE),
                  fontSize: 35,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 20),
            child: Text(
              'Current Score',
              style: TextStyle(color: Color(0xff00ADB5), fontSize: 30),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Text(
              score,
              style: const TextStyle(color: Color(0xffEEEEEE), fontSize: 35),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 80),
            child: HomeButton(
                text: "Score Board",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => LeaderBoard(LoggedInuser: LoggedInuser,)),
                  );
                }),
          ),
          Spacer(flex: 1),
          ListTile(
            leading: Icon(
              Icons.exit_to_app,
              color: Color(0xffcc2e2e),
              size: 30,
            ),
            title: const Text(
              "Logout",
              style: TextStyle(
                  color: Color(0xffcc2e2e),
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            onTap: onTap,
          )
        ],
      ),
    );
  }
}
