abstract class ImageBlocState{}

class ImageBlocLoading extends ImageBlocState{}
class ImageBlocLoaded extends ImageBlocState{
  final String url;
  ImageBlocLoaded(this.url);
}
class ImageBlocError extends ImageBlocState{}