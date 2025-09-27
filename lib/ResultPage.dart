import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/CustomWidgets/GenerateButton.dart';
import 'package:test_task/CustomWidgets/ImageCard.dart';
import 'package:test_task/CustomWidgets/ResultPageButton.dart';
import 'package:test_task/bloc/result_page/image_bloc/image_bloc.dart';
import 'package:test_task/bloc/result_page/image_bloc/image_events.dart';

import 'CustomWidgets/BackgroundGradient.dart';

class ResultPage extends StatefulWidget{
  final VoidCallback newPromptButtonPressed;
  const ResultPage({super.key, required this.newPromptButtonPressed});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BackgroundGradient(),
          Center(
            child: BlocProvider(
              create: (BuildContext context) => ImageBloc(),
              child: Builder(
                builder: (context) => Column(
                  children: [
                    const SizedBox(height: 200),
                    ImageCard(),
                    const SizedBox(height: 30),
                    GestureDetector(
                      onTap: () {
                        context.read<ImageBloc>().add(LoadImage());
                      },
                      child: ResultPageButton(
                        height: 60,
                        width: 150,
                        color: Colors.grey.shade700,
                        text: "Try another",
                      ),
                    ),
                    const SizedBox(height: 20),
                    GestureDetector(
                      onTap: (){
                        widget.newPromptButtonPressed();
                      },
                      child: ResultPageButton(
                        height: 60,
                        width: 150,
                        color: Colors.grey.shade700,
                        text: "New prompt",
                      ),
                    ),
                  ],
                ),
              ),
            ),

          ),
        ],
      )
    );
  }
}