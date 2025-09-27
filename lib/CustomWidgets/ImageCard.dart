import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/result_page/image_bloc/image_bloc.dart';
import '../bloc/result_page/image_bloc/image_events.dart';
import '../bloc/result_page/image_bloc/image_states.dart';
import 'ResultPageButton.dart';

class ImageCard extends StatefulWidget {
  const ImageCard({super.key});

  @override
  State<ImageCard> createState() => _ImageCardState();
}

class _ImageCardState extends State<ImageCard> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ImageBloc>().add(LoadImage());
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ImageBloc, ImageBlocState>(
      listener: (context, state) {
        if (state is ImageBlocError) {
          showDialog(
            context: context,
            builder: (_) {
              return AlertDialog(
                title: Text(
                    "Could not generate an image",
                  style: TextStyle(color: Colors.grey.shade400, fontSize: 20),
                ),
                icon: const Icon(Icons.sentiment_dissatisfied, size: 50,),
                iconColor: Colors.grey.shade500,
                backgroundColor: Colors.grey.shade600,
                actions: [
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        context.read<ImageBloc>().add(LoadImage());
                        Navigator.pop(context);
                        },
                      child: ResultPageButton(
                        height: 50,
                        width: 100,
                        color: Colors.grey.shade700,
                        text: "Retry",
                      ),
                    ),
                  ),
                ],
              );
            },
          );
        }
      },
      child: BlocBuilder<ImageBloc, ImageBlocState>(
        builder: (context, state) {
          return SizedBox(
            width: 350,
            height: 200,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: _buildContent(state),
            ),
          );
        },
      ),
    );
  }

  Widget _buildContent(ImageBlocState state) {
    if (state is ImageBlocLoading) {
      return const Center(
        child: SizedBox(
          width: 40,
          height: 40,
          child: CircularProgressIndicator(
            strokeWidth: 3,
            color: Colors.grey,
          ),
        ),
      );
    } else if (state is ImageBlocLoaded) {
      print(state.url);
      return Image.network(
        state.url,
        fit: BoxFit.cover,
      );
    } else {
      return const SizedBox.shrink(); // fallback for initial/other states
    }
  }
}
