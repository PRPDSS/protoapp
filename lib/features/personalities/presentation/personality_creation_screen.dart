import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:protoapp/features/personalities/presentation/widgets/frame_selector.dart';
import 'package:protoapp/features/personalities/presentation/widgets/layer_selector.dart';
import 'package:protoapp/features/personalities/presentation/widgets/pixel_canvas.dart';
import 'package:protoapp/features/personalities/providers/canvas_cubit.dart';

class PersonalityCreationScreen extends StatefulWidget {
  const PersonalityCreationScreen({super.key});

  @override
  State<PersonalityCreationScreen> createState() =>
      _PersonalityCreationScreenState();
}

class _PersonalityCreationScreenState extends State<PersonalityCreationScreen> {
  @override
  Widget build(BuildContext context) {
    String name = 'New personality';
    String animationData = '';
    return BlocProvider(
      create: (context) => CanvasCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: TextField(
            controller: TextEditingController(text: name),
            onChanged: (value) {
              name = value == '' ? name : value;
            },
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(child: PixelCanvas()),
            Row(
              children: [FrameSelector(), LayerSelector()],
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.save_outlined),
          onPressed: () {
            Navigator.of(context)
                .pop({'name': name, 'animationData': animationData});
          },
        ),
      ),
    );
  }
}
