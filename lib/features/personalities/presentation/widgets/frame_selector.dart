import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:protoapp/features/personalities/providers/canvas_cubit.dart';

class FrameSelector extends StatelessWidget {
  const FrameSelector({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<CanvasCubit>().state;

    return DropdownButton<int>(
      value: state.activeFrame,
      items: List.generate(
        state.scene[state.activeSprite].frameCount,
        (index) => DropdownMenuItem(
          value: index,
          child: Text('Frame $index'),
        ),
      ),
      onChanged: (value) {
        if (value != null) {
          context.read<CanvasCubit>().changeActiveFrame(value);
        }
      },
    );
  }
}
