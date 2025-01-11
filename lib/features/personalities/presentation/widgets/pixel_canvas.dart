import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:protoapp/features/personalities/providers/canvas_cubit.dart';
import 'package:protoapp/features/personalities/providers/canvas_state.dart';

class PixelCanvas extends StatelessWidget {
  const PixelCanvas({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CanvasCubit, CanvasState>(
      bloc: BlocProvider.of<CanvasCubit>(context),
      builder: (context, state) {
        // Получаем ширину экрана
        final screenWidth = MediaQuery.of(context).size.width;
        // Вычисляем размер пикселя
        final pixelSize = screenWidth / state.width;

        return InteractiveViewer(
          // Настройка масштабирования
          minScale: 0.2,
          maxScale: 5.0,
          panEnabled: true, // Включает перемещение
          scaleEnabled: true, // Включает масштабирование
          transformationController:
              TransformationController(), // Исключаем вращение
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(
              state.height,
              (y) => Row(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(
                  state.width,
                  (x) => SizedBox(
                    width: pixelSize,
                    height: pixelSize,
                    child: Container(color: state.selectedColor),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
