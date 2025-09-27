import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/bloc/prompt_page/generate_button_bloc/generate_button_bloc.dart';
import 'package:test_task/bloc/prompt_page/generate_button_bloc/text_form_events.dart';

import 'CustomWidget.dart';

class CustomTextForm extends StatefulWidget{
  final double width;
  final double height;

  const CustomTextForm({super.key, required this.width, required this.height});

  @override
  State<CustomTextForm> createState() => _CustomTextFormState();
}

class _CustomTextFormState extends State<CustomTextForm> {
  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<GenerateButtonBloc>().add(TextFormEmptied());
  }
  @override
  Widget build(BuildContext context) {
    return CustomWidget(
      height: widget.height,
      width: widget.width,
      color: Colors.grey.shade700,
      child: Align(
        alignment: Alignment.topLeft,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: controller,
            maxLines: null,
            decoration: InputDecoration(
              hintText: "Describe what you want to see...",
              hintStyle: TextStyle(
                  color: Colors.grey.shade400
              ),
            ),
            style: TextStyle(
              color: Colors.grey.shade300,
            ),
            onChanged: (_){
              if (controller.text.trim().isEmpty){
                context.read<GenerateButtonBloc>().add(TextFormEmptied());
              }
              else {
                context.read<GenerateButtonBloc>().add(TextFormChanged());
              }
            },
          ),
        ),
      ),
    );
  }
}