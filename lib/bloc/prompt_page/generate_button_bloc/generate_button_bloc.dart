import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/bloc/prompt_page/generate_button_bloc/text_form_events.dart';
import 'generate_button_states.dart';

class GenerateButtonBloc extends Bloc<TextFormEvent, GenerateButtonBlocState>{
  GenerateButtonBloc() : super(GenerateButtonBlocLocked()) {
    on<TextFormChanged>((event, emit) {
      emit(GenerateButtonBlocUnlocked());
    });
    on<TextFormEmptied>((event, emit){
      emit(GenerateButtonBlocLocked());
    });
  }
}