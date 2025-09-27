import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BackgroundGradient extends StatelessWidget{
  const BackgroundGradient({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                Colors.grey, Colors.grey.shade700,
              ]
          )
        ),
      )
    );
  }
  
}