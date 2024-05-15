import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:greedy_dice_project/models/user_model.dart';

class LeaderBoard extends StatefulWidget {
  const LeaderBoard({super.key});

  @override
  State<LeaderBoard> createState() => _LeaderBoard();
}

class _LeaderBoard extends State<LeaderBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff222831),
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Color(0xff222831),
        title: Text(
          "Leaderboard",
          style: TextStyle(
            color: Color(0xffdddddd),
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          color: Color(0xffdddddd),
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context)
                .pop(); // Navigate back when the back button is pressed
          },
        ),
      ),
      body: Stack(
        children: [
          Stack(
            children: [
              Positioned(
                child: Column(
                  children: [
                    Image.asset(
                      "assets/images/leaderBoard.png",
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height / 2.1,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  color: Color(0xff393E46),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(25))),
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemCount: userItems.length,
                  itemBuilder: (context, index) {
                    final items = userItems[index];
                    return Padding(
                      padding: EdgeInsets.only(right: 15, left: 15, top: 15),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xff222831),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        height: 50,
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 5,
                            ),
                            CircleAvatar(
                              radius: 20,
                              backgroundImage: AssetImage(items.image),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Row(
                              children: [
                                Row(
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          items.name,
                                          style: const TextStyle(
                                              color: Color(0xff00ADB5),
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          "#${items.rank}",
                                          style: const TextStyle(
                                              color: Color(0xffdddddd),
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 175,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            (items.point).toString() + " ⭐",
                                            style: TextStyle(
                                                color: Color(0xffdddddd),
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "John Doe",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xff00ADB5),
                        fontSize: 16),
                  ),
                  Text(
                    "124 ⭐",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xffdddddd),
                        fontSize: 14),
                  ),
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage("assets/images/a.png"),
                  ),
                ],
              ),
            ],
          ),
          const Positioned(
            top: 40,
            left: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Jack Max",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xff00ADB5),
                          fontSize: 16),
                    ),
                    Text(
                      "112 ⭐",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xffdddddd),
                          fontSize: 14),
                    ),
                    CircleAvatar(
                      radius: 35,
                      backgroundImage: AssetImage("assets/images/b.png"),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Positioned(
            top: 40,
            right: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Joe",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xff00ADB5),
                          fontSize: 16),
                    ),
                    Text(
                      "99 ⭐",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xffdddddd),
                          fontSize: 14),
                    ),
                    CircleAvatar(
                      radius: 35,
                      backgroundImage: AssetImage("assets/images/c.png"),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
