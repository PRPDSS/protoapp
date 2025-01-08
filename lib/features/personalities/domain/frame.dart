import 'package:flutter/material.dart';

class Frame {
  final int height;
  final int width;
  final List<Color> bitmap;
  Frame(this.height, this.width, this.bitmap);

  /// Возвращает цвет пикселя на координатах `(x, y)`.
  ///
  /// y - вертикальная ось (направлена сверху вниз),
  /// x - горизонтальная ось (направлена слева направо)
  Color getPixelColor(int x, int y) {
    if (x >= width || y >= height) return Colors.transparent;

    return bitmap[x + y * width];
  }
}
