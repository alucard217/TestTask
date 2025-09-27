import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/CustomWidgets/BackgroundGradient.dart';
import 'package:test_task/CustomWidgets/GenerateButton.dart';
import 'package:test_task/CustomWidgets/CustomTextForm.dart';
import 'package:test_task/bloc/prompt_page/generate_button_bloc/generate_button_bloc.dart';

class PromptPage extends StatelessWidget{

  final VoidCallback generateButtonPressed;
  const PromptPage({super.key, required this.generateButtonPressed});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BackgroundGradient(),
          BlocProvider(
            create: (BuildContext context) => GenerateButtonBloc(),
            child: Center(
              child: Column(
                children: [
                  const SizedBox(height: 300),
                  CustomTextForm(height: 200, width: 350),
                  const SizedBox(height: 30),
                  GenerateButton(height: 70, width: 150, onTap: generateButtonPressed),
                ],
              ),
            ),
          ),
        ]
      ),
    );
  }

}