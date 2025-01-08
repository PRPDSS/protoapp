import 'package:flutter/material.dart';

class Sprite {
  /// Название спрайта
  final String name;

  /// Выстоа спрайта
  final int height;

  /// Ширина спрайта
  final int width;

  /// Количество кадрав спрайта
  int _frameCount;

  /// Битмап (массив кадров (кадры - одномерный массив (я конч)))
  List<List<Color>> _bitmap;

  Sprite({
    required this.name,
    required this.height,
    required this.width,
    required frameCount,
  })  : _frameCount = frameCount,
        _bitmap = List.generate(frameCount,
            (_) => List.generate(height * width, (_) => Colors.transparent));

  /// Удалить лишние кадры из памяти
  void cutExcessiveFrames() {
    if (_bitmap.length > _frameCount) {
      _bitmap = _bitmap.sublist(0, _frameCount);
    }
  }
}
