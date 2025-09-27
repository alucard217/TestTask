import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResultPageButton extends StatelessWidget{
  final double height;
  final double width;
  final Color color;
  final String text;
  const ResultPageButton({super.key, required this.height, required this.width, required this.color, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: Colors.grey.shade300,
          ),
        ),
      ),
    );
  }

}