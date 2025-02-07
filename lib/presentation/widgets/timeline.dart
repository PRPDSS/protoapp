import 'package:flutter/material.dart';
import '../../domain/models/frame.dart';

class Timeline extends StatelessWidget {
  final List<Frame> frames;
  final int currentFrameIndex;
  final Function(int) onFrameSelected;

  const Timeline({
    required this.frames,
    required this.currentFrameIndex,
    required this.onFrameSelected,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100, // Высота таймлайна
      color: Colors.grey[850], // Цвет фона
      child: ListView.builder(
        scrollDirection: Axis.horizontal, // Горизонтальный скролл
        itemCount: frames.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => onFrameSelected(index), // Выбор кадра
            child: Container(
              width: 80, // Ширина превью кадра
              margin: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                border: Border.all(
                  color: index == currentFrameIndex
                      ? Colors.blue // Выделение текущего кадра
                      : Colors.transparent,
                  width: 2,
                ),
              ),
              child: _FramePreview(frame: frames[index]),
            ),
          );
        },
      ),
    );
  }
}

class _FramePreview extends StatelessWidget {
  final Frame frame;

  const _FramePreview({required this.frame});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _FramePreviewPainter(frame: frame),
    );
  }
}

class _FramePreviewPainter extends CustomPainter {
  final Frame frame;

  _FramePreviewPainter({required this.frame});

  @override
  void paint(Canvas canvas, Size size) {
    final cellSize = size.width / 8; // Превью 8x8 пикселей
    final layer = frame.layers[0]; // Используем первый слой для превью

    // Рисуем пиксели
    for (int y = 0; y < 8; y++) {
      for (int x = 0; x < 8; x++) {
        final paint = Paint()..color = layer.pixels[y][x];
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
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}