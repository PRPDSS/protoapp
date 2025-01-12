import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:protoapp/features/personalities/providers/canvas_cubit.dart';

class PixelArtCanvas extends StatelessWidget {
  const PixelArtCanvas({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<CanvasCubit>().state;
    final pixelSize = 20.0; // Размер одного пикселя на экране

    return GestureDetector(
      onTapDown: (details) => _handleTap(details, context, pixelSize),
      // onPanUpdate: (details) => _handleTap(details, context, pixelSize),
      child: SizedBox(
        width: state.width * pixelSize,
        height: state.height * pixelSize,
        child: CustomPaint(
          painter: _PixelArtPainter(
            width: state.width,
            height: state.height,
            bitmap: state.scene[state.activeSprite].bitmap,
          ),
        ),
      ),
    );
  }

  void _handleTap(
      TapDownDetails details, BuildContext context, double pixelSize) {
    final state = context.read<CanvasCubit>().state;

    final dx = details.localPosition.dx ~/ pixelSize;
    final dy = details.localPosition.dy ~/ pixelSize;

    if (dx >= 0 && dx < state.width && dy >= 0 && dy < state.height) {
      context.read<CanvasCubit>().drawPixel(state.selectedColor, dx, dy);
    }
  }
}

class _PixelArtPainter extends CustomPainter {
  final int width;
  final int height;
  final List<Color> bitmap;

  _PixelArtPainter({
    required this.width,
    required this.height,
    required this.bitmap,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final pixelPaint = Paint();
    final gridPaint = Paint()
      ..color = Colors.grey.shade300
      ..strokeWidth = 1.0;

    final pixelSize = size.width / width;

    for (int y = 0; y < height; y++) {
      for (int x = 0; x < width; x++) {
        final color = bitmap[y * width + x];
        pixelPaint.color = color;

        canvas.drawRect(
          Rect.fromLTWH(x * pixelSize, y * pixelSize, pixelSize, pixelSize),
          pixelPaint,
        );
      }
    }

    // Рисуем сетку
    for (int y = 0; y <= height; y++) {
      final yOffset = y * pixelSize;
      canvas.drawLine(
        Offset(0, yOffset),
        Offset(size.width, yOffset),
        gridPaint,
      );
    }

    for (int x = 0; x <= width; x++) {
      final xOffset = x * pixelSize;
      canvas.drawLine(
        Offset(xOffset, 0),
        Offset(xOffset, size.height),
        gridPaint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
