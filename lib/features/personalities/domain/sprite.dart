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

  /// Пустой кадр, используется при увеличении числа кадров
  final List<Color> _emptyFrame;

  Sprite({
    required this.name,
    required this.height,
    required this.width,
    required frameCount,
  })  : _frameCount = frameCount,
        _bitmap = List.generate(frameCount,
            (_) => List.generate(height * width, (_) => Colors.transparent)),
        _emptyFrame = List.generate(height * width, (_) => Colors.transparent);

  /// Удалить лишние кадры из памяти
  void cutExcessiveFrames() {
    if (_bitmap.length > _frameCount) {
      _bitmap = _bitmap.sublist(0, _frameCount);
    }
  }

  set frameCount(int frameCount) {
    _frameCount = frameCount;
    if (_bitmap.length < _frameCount) {
      _bitmap +=
          List.generate(_frameCount - _bitmap.length, (_) => _emptyFrame);
    }
  }

  void resize() {}

  int get frameCount => _frameCount;

  List<List<Color>> get bitMap => _bitmap;
}
