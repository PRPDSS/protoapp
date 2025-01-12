import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:protoapp/features/personalities/providers/canvas_cubit.dart';

class ColorSelector extends StatelessWidget {
  const ColorSelector({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = [
      Colors.red,
      Colors.green,
      Colors.blue,
      Colors.yellow,
      Colors.purple,
      Colors.black,
      Colors.transparent,
    ];

    return Row(
      children: colors
          .map(
            (color) => GestureDetector(
              onTap: () {
                context.read<CanvasCubit>().changeSelectedColor(color);
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: color,
                  border: Border.all(
                    color: Colors.grey.shade800,
                    width: 1,
                  ),
                  shape: BoxShape.circle,
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
