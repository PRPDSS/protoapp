import 'package:flutter/material.dart';

class Sprite {
  /// Название спрайта
  final String name;

  /// Выстоа спрайта
  final int height;

  /// Ширина спрайта
  final int width;

  /// Количество кадрав спрайта
  final int frameCount;

  /// Битмап (массив кадров (кадры - одномерный массив (я конч)))
  final List<Color> bitmap;

  Sprite({
    required this.name,
    required this.height,
    required this.width,
    required this.frameCount,
    required this.bitmap,
  });

  Map<String, dynamic> toJsonMap() {
    return {
      'name': name,
      'height': height,
      'width': width,
      'frameCount': frameCount,
      'bitmap': bitmap, 
    };
  }
}
