// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class RollButton extends StatefulWidget with ActivateRollButton {
  RollButton(
      {super.key,
      required this.onTap,
      required this.text,
      this.isActive = true});
  final VoidCallback onTap;
  bool isActive;

  final String text;
  final _RollButtonState _rollButtonState = _RollButtonState();

  @override
  State<RollButton> createState() => _rollButtonState;

  @override
  active() => _rollButtonState.active();

  @override
  unActive() => _rollButtonState.unActive();
}

class _RollButtonState extends State<RollButton> with ActivateRollButton {
  late Color backgroundColor;
  late Color foregroundColor;

  @override
  void initState() {
    super.initState();
    defaultColors();
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,

        padding:
            const EdgeInsets.symmetric(horizontal: 40, vertical: 8), // Padding
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12), // Rounded corners
        ),
      ),
      onPressed: widget.isActive ? onClick : () {},
      child: Text(
        widget.text,
        style: const TextStyle(
            color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold),
      ),
    );
  }

// roll dice when click
  void onClick() {
    widget.onTap();
  }

// change button style when clicked

  void unActive() {
    // hold roll dice button
    setState(() {
      backgroundColor = Colors.grey;
      foregroundColor = Colors.grey;
      widget.isActive = false;
    });
  }

// change button style when clicked
  void active() {
    setState(() {
      defaultColors();
      widget.isActive = true;
    });
  }

  void defaultColors() {
    backgroundColor = const Color(0xff00ABB3);
    foregroundColor = const Color(0xff6CCCD1);
  }
}

mixin ActivateRollButton {
  active();
  unActive();
}
