import 'package:flutter/material.dart';
import 'package:greedy_dice_project/models/api_service_model.dart';
import 'package:greedy_dice_project/widgets/popup_password.dart';

import '../models/user_model.dart';

class LeaderBoard extends StatefulWidget {
  final User LoggedInuser;
  const LeaderBoard({super.key,required this.user});

  @override

  State<LeaderBoard> createState() => _LeaderBoard();
}

class _LeaderBoard extends State<LeaderBoard> {
  List users = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getUsers();
  }

  // GET ALL USERS FORM THE API
  Future<void> getUsers() async {
    List fetchedUsers = await APIServiceModel.getUsersListDescending();
    setState(() {
      users = fetchedUsers;
      isLoading = false;
    });
  }
  void handleTap(int index) {
    var user = users[index];
    showPasswordDialog(context,user,LoggedInuser);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      backgroundColor: Color(0xff222831),
      body: isLoading? Center(child: CircularProgressIndicator()): Stack(
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
                  itemCount: users.length,
                  itemBuilder: (context, index) {
                    final items = users;
                    return GestureDetector(
                      onTap: () => handleTap(index),
                      child: Padding(
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
                                backgroundImage:
                                    NetworkImage(items[index]['avatar']),
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
                                            items[index]['name'],
                                            style: const TextStyle(
                                                color: Color(0xff00ADB5),
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            "#${index + 1}",
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
                                              (items[index]['score'])
                                                      .toString() +
                                                  " ⭐",
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
                      ),
                    );
                  }),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    '${users[0]['name']}',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xff00ADB5),
                        fontSize: 16),
                  ),
                  Text(
                    '${users[0]['score']} ⭐',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xffdddddd),
                        fontSize: 14),
                  ),
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage(users[0]['avatar']),
                  ),
                ],
              ),
            ],
          ),
          Positioned(
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
                      '${users[1]['name']}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xff00ADB5),
                          fontSize: 16),
                    ),
                    Text(
                      '${users[1]['score']} ⭐',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xffdddddd),
                          fontSize: 14),
                    ),
                    CircleAvatar(
                      radius: 35,
                      backgroundImage: NetworkImage(users[1]['avatar']),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
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
                      '${users[2]['name']}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xff00ADB5),
                          fontSize: 16),
                    ),
                    Text(
                      '${users[2]['score']} ⭐',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xffdddddd),
                          fontSize: 14),
                    ),
                    CircleAvatar(
                      radius: 35,
                      backgroundImage: NetworkImage(users[2]['avatar']),
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
