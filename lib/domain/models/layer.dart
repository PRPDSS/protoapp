import 'package:flutter/material.dart';

class Layer {
  final int width;
  final int height;
  final List<List<Color>> pixels;

  Layer({
    required this.width,
    required this.height,
    List<List<Color>>? pixels,
  }) : pixels = pixels ??
            List.filled(height, List.filled(width, Colors.transparent));

  /// Копирует слой с новыми параметрами
  Layer copyWith({
    int? width,
    int? height,
    List<List<Color>>? pixels,
  }) {
    return Layer(
      width: width ?? this.width,
      height: height ?? this.height,
      pixels: pixels ?? this.pixels,
    );
  }
}
