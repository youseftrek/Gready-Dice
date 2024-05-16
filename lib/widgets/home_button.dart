import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeButton extends StatelessWidget {
  const HomeButton({super.key, required this.text, required this.onTap});
  final String text;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    // Get the screen width and height
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return ElevatedButton(
      child: Text(
        text,
        style: TextStyle(
          fontSize: screenWidth * 0.07, // Responsive font size
          fontWeight: FontWeight.bold,
        ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xff00ADB5),
        foregroundColor: Color(0xffEEEEEE),
        minimumSize: Size(screenWidth * 0.6, screenHeight * 0.08), // Responsive button size
      ),
      onPressed: onTap,
    );
  }
}
