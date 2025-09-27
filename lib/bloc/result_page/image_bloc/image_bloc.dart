import 'dart:math';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'image_events.dart';
import 'image_states.dart';

class ImageBloc extends Bloc<ImageBlocEvent, ImageBlocState> {
  final List<String> urls = [
    "https://upload.wikimedia.org/wikipedia/it/f/f0/Screenshot_Videoclip_Never_Gonna_Give_You_Up.png",
    "https://media.istockphoto.com/id/507714936/photo/close-up-of-mixed-breed-monkey-between-chimpanzee-and-bonobo-smiling.jpg?s=612x612&w=0&k=20&c=Z5PFpPKkDFEQV8ZQfJls25_mSbY90-_Mj5Xoslp9yIk=",
    "https://i.ytimg.com/vi/9q6eL3iSATM/maxresdefault.jpg",
  ];
  final _random = Random();

  ImageBloc() : super(ImageBlocLoading()) {
    on<LoadImage>((event, emit) async {
      emit(ImageBlocLoading());
      await Future.delayed(const Duration(seconds: 2));

      if (Random().nextBool()){
      final index = _random.nextInt(urls.length);
      final url = urls[index];
      emit(ImageBlocLoaded(url));
      }
      else {
        emit(ImageBlocError());
      }
    });
  }
}
