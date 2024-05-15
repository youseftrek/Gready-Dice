import 'package:flutter/material.dart';

class Signup_Textfield extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;

  const Signup_Textfield({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 25.0,
      ),
      child: TextField(
        style: const TextStyle(color: Color(0xFFEEEEEE)),
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(color: Color(0xFFA6A6A6) , width: 2)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(color: Color(0xFF00ADB5), width: 2)),
          fillColor: const Color(0xFF323b48),
          filled: true,
          hintText: hintText,
          hintStyle: const TextStyle(color: Color(0xFFA6A6A6)),
          contentPadding: const EdgeInsets.all(20),

        ),
      ),
    );
  }
}
