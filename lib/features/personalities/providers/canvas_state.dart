import 'package:flutter/material.dart';
import 'package:protoapp/features/personalities/domain/sprite.dart';

class CanvasState {
  final int activeSprite;
  final int activeFrame;
  final Color selectedColor;
  final int height;
  final int width;
  List<Sprite> scene;

  CanvasState({
    required this.activeSprite,
    required this.activeFrame,
    required this.selectedColor,
    required this.height,
    required this.width,
  }) : scene = [
          Sprite(
            name: '',
            height: height,
            width: width,
            frameCount: 1,
            bitmap: List.filled(width * height, Colors.transparent),
          ),
        ];

  CanvasState copyWith({
    int? activeSprite,
    int? activeFrame,
    Color? selectedColor,
    int? height,
    int? width,
    List<Sprite>? scene,
  }) {
    return CanvasState(
      activeSprite: activeSprite ?? this.activeSprite,
      activeFrame: activeFrame ?? this.activeFrame,
      selectedColor: selectedColor ?? this.selectedColor,
      height: height ?? this.height,
      width: width ?? this.width,
      // scene: scene ?? this.scene,
    );
  }
}
