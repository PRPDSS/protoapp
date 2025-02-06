import 'package:flutter/material.dart';
import 'package:protoapp/domain/models/pixel_scene.dart';

class PixelGrid extends StatelessWidget {
  final PixelScene scene;
  final Function(int x, int y) onPixelTapped;

  const PixelGrid({
    required this.scene,
    required this.onPixelTapped,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final currentFrame = scene.frames[scene.currentFrameIndex];
    final currentLayer = currentFrame.layers[scene.currentLayerIndex];
    return Container(
      padding: EdgeInsets.all(16),
      child: LayoutBuilder(
        builder: (context, constraints) {
          // Рассчитываем размер ячейки так, чтобы сетка была квадратной
          final cellSize = _calculateCellSize(constraints);

          return GestureDetector(
            onPanDown: (details) => _handleTap(details.localPosition, cellSize),
            onPanUpdate: (details) =>
                _handleTap(details.localPosition, cellSize),
            child: CustomPaint(
              size: Size(
                cellSize * scene.width,
                cellSize * scene.height,
              ),
              painter: _GridPainter(
                width: scene.width,
                height: scene.height,
                pixels: currentLayer.pixels,
                cellSize: cellSize,
              ),
            ),
          );
        },
      ),
    );
  }

  /// Рассчитывает размер ячейки так, чтобы сетка была квадратной
  double _calculateCellSize(BoxConstraints constraints) {
    final maxWidth = constraints.maxWidth;
    final maxHeight = constraints.maxHeight;

    // Выбираем минимальное значение, чтобы сетка была квадратной
    final double cellSize =
        (maxWidth / scene.width).clamp(0, maxHeight / scene.height);
    return cellSize;
  }

  void _handleTap(Offset localPosition, double cellSize) {
    final x = (localPosition.dx / cellSize).floor();
    final y = (localPosition.dy / cellSize).floor();

    if (x >= 0 && x < scene.width && y >= 0 && y < scene.height) {
      print('$x,$y');
      onPixelTapped(x, y);
    }
  }
}

class _GridPainter extends CustomPainter {
  final int width;
  final int height;
  final List<List<Color>> pixels;
  final double cellSize;

  _GridPainter({
    required this.width,
    required this.height,
    required this.pixels,
    required this.cellSize,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // Рисуем пиксели
    for (int x = 0; x < width; x++) {
      for (int y = 0; y < height; y++) {
        final paint = Paint()..color = pixels[y][x];
        canvas.drawRect(
          Rect.fromLTWH(
            x * cellSize,
            y * cellSize,
            cellSize,
            cellSize,
          ),
          paint,
        );
      }
    }

    // Рисуем сетку
    final gridPaint = Paint()
      ..color = Colors.grey
      ..style = PaintingStyle.stroke;

    for (int i = 0; i <= width; i++) {
      canvas.drawLine(
        Offset(i * cellSize, 0),
        Offset(i * cellSize, height * cellSize),
        gridPaint,
      );
    }

    for (int i = 0; i <= height; i++) {
      canvas.drawLine(
        Offset(0, i * cellSize),
        Offset(width * cellSize, i * cellSize),
        gridPaint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
