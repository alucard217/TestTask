import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class CustomWidget extends StatelessWidget {
  final double width;
  final double height;
  final Color color;
  final Widget? child;
  const CustomWidget({super.key, required this.width, required this.height, this.child, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        border: Border.all(
          style: BorderStyle.none,
        ),
        borderRadius: BorderRadius.circular(20),
        color: color,
      ),
      child: child,
    );
  }
}