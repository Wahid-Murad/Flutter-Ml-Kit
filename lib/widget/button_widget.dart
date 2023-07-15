import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  ButtonWidget(
      {super.key,
      required this.width,
      required this.height,
      required this.child,
      required this.onPressed,
      required this.color});
  final double width;
  final double height;
  final Widget child;
  final Color color;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Container(
        width: width,
        height: height,
        color: color,
        child: child,
      ),
    );
  }
}
