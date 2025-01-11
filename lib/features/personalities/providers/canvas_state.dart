import 'dart:ui';

import 'package:protoapp/features/personalities/domain/sprite.dart';

class CanvasState {
  final int activeLayer;
  final int activeFrame;
  final Color selectedColor;
  final int height;
  final int width;
  List<Sprite> scene;

  CanvasState({
    required this.activeLayer,
    required this.activeFrame,
    required this.selectedColor,
    required this.height,
    required this.width,
  }) : scene = [
          Sprite(
            name: '',
            height: 8,
            width: 8,
            frameCount: 1,
          )
        ];

  CanvasState copyWith({
    int? activeLayer,
    int? activeFrame,
    Color? selectedColor,
    int? height,
    int? width,
    List<Sprite>? scene,
  }) {
    return CanvasState(
      activeLayer: activeLayer ?? this.activeLayer,
      activeFrame: activeFrame ?? this.activeFrame,
      selectedColor: selectedColor ?? this.selectedColor,
      height: height ?? this.height,
      width: width ?? this.width,
      // scene: scene ?? this.scene,
    );
  }
}
