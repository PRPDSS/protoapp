import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:protoapp/features/personalities/providers/canvas_cubit.dart';

class SpriteSelector extends StatelessWidget {
  const SpriteSelector({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<CanvasCubit>().state;

    return DropdownButton<int>(
      value: state.activeSprite,
      items: List.generate(
        state.scene.length,
        (index) => DropdownMenuItem(
          value: index,
          child: Text('Sprite $index'),
        ),
      ),
      onChanged: (value) {
        if (value != null) {
          context.read<CanvasCubit>().changeActiveLayer(value);
        }
      },
    );
  }
}
