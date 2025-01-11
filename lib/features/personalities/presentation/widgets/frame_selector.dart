import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:protoapp/features/personalities/providers/canvas_cubit.dart';
import 'package:protoapp/features/personalities/providers/canvas_state.dart';

class FrameSelector extends StatelessWidget {
  const FrameSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CanvasCubit, CanvasState>(
      bloc: BlocProvider.of<CanvasCubit>(context),
      builder: (context, state) {
        return Container(
          height: 600,
          width: 66,
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onSurface.withAlpha(100)),
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.scene[state.activeLayer].frameCount,
              itemBuilder: (context, index) => Placeholder()),
          // FramePreview(state.scene[state.activeLayer]),)
        );
      },
    );
  }
}
