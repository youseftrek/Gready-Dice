import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:greedy_dice_project/models/api_service_model.dart';
import 'package:greedy_dice_project/widgets/popup_password.dart';

import '../models/user_model.dart';

class LeaderBoard extends StatefulWidget {
  final User LoggedInuser;
  const LeaderBoard({super.key, required this.LoggedInuser});

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
    showPasswordDialog(context, user, widget.LoggedInuser);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: const Color(0xff222831),
        title: const Text(
          "Leaderboard",
          style: TextStyle(
            color: Color(0xffdddddd),
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          color: const Color(0xffdddddd),
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context)
                .pop(); // Navigate back when the back button is pressed
          },
        ),
      ),
      backgroundColor: const Color(0xff222831),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Stack(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Image.asset(
                    "assets/images/leaderBoard.png",
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width,
                  ),
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
                        topRight: Radius.circular(25),
                      ),
                    ),
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemCount: users.length,
                      itemBuilder: (context, index) {
                        final items = users;
                        return GestureDetector(
                          onTap: () => handleTap(index),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 8),
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color(0xff222831),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              height: 50,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width:
                                          MediaQuery.of(context).size.width / 3,
                                      child: Row(
                                        children: [
                                          CircleAvatar(
                                            radius: 20,
                                            backgroundImage: NetworkImage(
                                                items[index]['avatar']),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 10),
                                            child: Text(
                                              items[index]['name'],
                                              style: const TextStyle(
                                                color: Color(0xff00ADB5),
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Opacity(
                                      opacity: .2,
                                      child: Text(
                                        "#${index + 1}",
                                        style: const TextStyle(
                                            color: Color(0xffdddddd),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 24),
                                      ),
                                    ),
                                    Text(
                                      "${items[index]['score']} ⭐",
                                      style: const TextStyle(
                                        color: Color(0xffdddddd),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 5),
                      Text(
                        users.isNotEmpty ? '${users[0]['name']}' : '',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xff00ADB5),
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        users.isNotEmpty ? '${users[0]['score']} ⭐' : '',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xffdddddd),
                          fontSize: 14,
                        ),
                      ),
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: users.isNotEmpty
                            ? NetworkImage(users[0]['avatar'])
                            : null,
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 40,
                  left: MediaQuery.of(context).size.width * 0.12,
                  child: Column(
                    children: [
                      const SizedBox(height: 5),
                      Text(
                        users.length > 1 ? '${users[1]['name']}' : '',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xff00ADB5),
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        users.length > 1 ? '${users[1]['score']} ⭐' : '',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xffdddddd),
                          fontSize: 14,
                        ),
                      ),
                      CircleAvatar(
                        radius: 35,
                        backgroundImage: users.length > 1
                            ? NetworkImage(users[1]['avatar'])
                            : null,
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 40,
                  right: MediaQuery.of(context).size.width * 0.12,
                  child: Column(
                    children: [
                      const SizedBox(height: 5),
                      Text(
                        users.length > 2 ? '${users[2]['name']}' : '',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xff00ADB5),
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        users.length > 2 ? '${users[2]['score']} ⭐' : '',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xffdddddd),
                          fontSize: 14,
                        ),
                      ),
                      CircleAvatar(
                        radius: 35,
                        backgroundImage: users.length > 2
                            ? NetworkImage(users[2]['avatar'])
                            : null,
                      ),
                    ],
                  ),
                )
              ],
            ),
    );
  }
}
