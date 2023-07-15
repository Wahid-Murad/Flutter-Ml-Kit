import 'package:flutter/material.dart';

class ContainerWidget extends StatelessWidget {
  ContainerWidget({
    super.key,
    required this.width,
    required this.height,
    required this.child,
  });

  final double width;
  final double height;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      color: Colors.grey[300],
      child: child,
    );
  }
}
