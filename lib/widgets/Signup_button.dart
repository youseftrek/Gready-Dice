import 'package:flutter/material.dart';

class Signup_button extends StatelessWidget {

  final Function() ? onTap;
  final String label;
  const Signup_button({super.key,required this.onTap,required this.label,});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(25),
        // margin: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          color: const Color(0xFF00ADB5),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          child: Text(label,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              )),
        ),
      ),
    );
  }
}
