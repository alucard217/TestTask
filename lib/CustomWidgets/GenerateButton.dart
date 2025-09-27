import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/CustomWidgets/CustomWidget.dart';

import '../bloc/prompt_page/generate_button_bloc/generate_button_bloc.dart';
import '../bloc/prompt_page/generate_button_bloc/generate_button_states.dart';

class GenerateButton extends StatefulWidget{
  final double width;
  final double height;
  final VoidCallback onTap;
  const GenerateButton({super.key, required this.width, required this.height, required this.onTap});

  @override
  State<GenerateButton> createState() => _GenerateButtonState();
}

class _GenerateButtonState extends State<GenerateButton> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenerateButtonBloc, GenerateButtonBlocState>(
        builder: (context, state){
          if (state is GenerateButtonBlocLocked){
            return CustomWidget(
                width: widget.width,
                height: widget.height,
                color: Colors.grey.shade800,
                child: Center(
                  child: Text(
                    "Generate",
                    style: TextStyle(
                        color: Colors.grey.shade500,
                        fontSize: 20,
                    ),
                  ),
                ),
              );
          }
          else if (state is GenerateButtonBlocUnlocked) {
            return GestureDetector(
              onTap: widget.onTap,
              child: CustomWidget(
                width: widget.width,
                height: widget.height,
                color: Colors.grey.shade700,
                child: Center(
                  child: Text(
                    "Generate",
                    style: TextStyle(
                      color: Colors.grey.shade300,
                      fontSize: 20
                    ),
                  ),
                ),
              ),
            );
          }
          else { return Text(""); }
        }
    );
  }
}