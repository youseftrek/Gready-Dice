import 'package:flutter/material.dart';

class GameRules extends StatelessWidget {
  const GameRules({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color.fromRGBO(35, 44, 70, 1),
        appBar: buildAppBar(),
        body: Container(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Game Rules Widget
            const Padding(
              padding: EdgeInsets.only(bottom: 100, top: 60),
              child: Text(
                "Game Rules",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            // Win Rule
            Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 30),
              child: Row(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    child: Image.asset('assets/icons/trophy.png'),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Win",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF76FF03),
                                  fontSize: 25),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "First Player Got 120 Win",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFFFFFFFF),
                                  fontSize: 20),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            const Divider(
              color: Colors.white,
              height: 20,
              thickness: 2,
              indent: 20,
              endIndent: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 30, top: 10),
              child: Row(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    child: Image.asset('assets/icons/game-over.png'),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Defeat",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red,
                                  fontSize: 25),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "First Player Got 120 Win",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFFFFFFFF),
                                  fontSize: 20),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            const Divider(
              color: Colors.white,
              height: 20,
              thickness: 2,
              indent: 20,
              endIndent: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 30, top: 10),
              child: Row(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    child: Image.asset('assets/icons/handshake.png'),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Draw",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.yellow,
                                  fontSize: 25),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "First Player Got 120 Win",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFFFFFFFF),
                                  fontSize: 20),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        )));
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: const Color.fromRGBO(35, 44, 70, 1),
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back_rounded,
          color: Colors.white,
          size: 40,
        ),
        onPressed: () {},
      ),
    );
  }
}
