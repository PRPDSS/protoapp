import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:protoapp/features/personalities/presentation/widgets/pixel_canvas.dart';
import 'package:protoapp/features/personalities/providers/canvas_cubit.dart';
import 'package:protoapp/features/personalities/providers/canvas_state.dart';

class PersonalityCreationScreen extends StatefulWidget {
  const PersonalityCreationScreen({super.key});

  @override
  State<PersonalityCreationScreen> createState() =>
      _PersonalityCreationScreenState();
}

class _PersonalityCreationScreenState extends State<PersonalityCreationScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => CanvasCubit(),
        child: Scaffold(
            appBar: AppBar(
              title: Text('New personality'),
            ),
            body: BlocBuilder<CanvasCubit, CanvasState>(
              builder: (context, state) {
                return ListView(
                  children: [PixelCanvas()],
                );
              },
            )));
  }
}
