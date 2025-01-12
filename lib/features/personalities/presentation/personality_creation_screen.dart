import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:protoapp/features/personalities/presentation/widgets/color_selector.dart';
import 'package:protoapp/features/personalities/presentation/widgets/frame_selector.dart';
import 'package:protoapp/features/personalities/presentation/widgets/sprite_selector.dart';
import 'package:protoapp/features/personalities/presentation/widgets/pixel_art_canvas.dart';
import 'package:protoapp/features/personalities/providers/canvas_cubit.dart';

class PersonalityCreationScreen extends StatefulWidget {
  const PersonalityCreationScreen({super.key});

  @override
  State<PersonalityCreationScreen> createState() =>
      _PersonalityCreationScreenState();
}

class _PersonalityCreationScreenState extends State<PersonalityCreationScreen> {
  @override
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CanvasCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Pixel Art Editor'),
        ),
        body: Column(
          children: [
            Expanded(
              child: PixelArtCanvas(),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SpriteSelector(),
                  FrameSelector(),
                  ColorSelector(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
