// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class RoundedIconButton extends StatefulWidget
    with ActivationRoundedIconButton {
  RoundedIconButton({
    super.key,
    required this.onTap,
    required this.icon,
    bool activation = true,
    this.activeColor = const Color(0xff00ABB3),
    this.unActiveColor = Colors.white,
  }) : _activation = activation;
  final VoidCallback onTap;
  final Icon icon;
  bool _activation;
  final Color activeColor;
  final Color unActiveColor;

  final _RoundedIconButtonState __roundedIconButtonState =
      _RoundedIconButtonState();
  @override
  State<RoundedIconButton> createState() => __roundedIconButtonState;

  @override
  active() => __roundedIconButtonState.active();

  @override
  unActive() => __roundedIconButtonState.unActive();
  bool isActive() => _activation;

  @override
  openScreen(Widget screen) {
    __roundedIconButtonState.openScreen(screen);
  }
}

class _RoundedIconButtonState extends State<RoundedIconButton>
    with ActivationRoundedIconButton {
  late Color hoverColor;
  late Color color;

  @override
  void initState() {
    super.initState();
    if (widget._activation) {
      active();
    } else {
      unActive();
    }
  }


  @override
  void active() {
    setState(() {
      defaultColors();
      widget._activation = true;
    });
  }

  @override
  void unActive() {
    // hold roll dice button
    setState(() {
      hoverColor = widget.unActiveColor;
      color = widget.unActiveColor;
      widget._activation = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(32),
      child: Container(
        decoration: BoxDecoration(color: color),
        child: IconButton(
          onPressed: (widget._activation) ? widget.onTap : () {},
          highlightColor: Colors.grey,
          hoverColor: hoverColor,
          icon: widget.icon,
        ),
      ),
    );
  }

  void defaultColors() {
    hoverColor = widget.activeColor;
    color = widget.activeColor;
  }

  bool isActive() => widget._activation;

  @override
  openScreen(Widget screen) {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
        builder: (context) => screen),
    );
  }
}

mixin ActivationRoundedIconButton {
  active();
  unActive();
  openScreen(Widget screen);
}

