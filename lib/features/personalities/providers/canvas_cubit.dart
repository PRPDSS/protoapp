import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:protoapp/features/personalities/domain/sprite.dart';
import 'package:protoapp/features/personalities/providers/canvas_state.dart';

class CanvasCubit extends Cubit<CanvasState> {
  CanvasCubit()
      : super(CanvasState(
          activeSprite: 0,
          activeFrame: 0,
          selectedColor: Colors.red,
          height: 16,
          width: 32,
        ));

  void changeActiveLayer(int activeLayer) {
    emit(state.copyWith(activeSprite: activeLayer));
  }

  void changeActiveFrame(int activeFrame) {
    emit(state.copyWith(activeFrame: activeFrame));
  }

  void changeSelectedColor(Color color) {
    emit(state.copyWith(selectedColor: color));
  }

  void drawPixel(Color color, int x, int y) {
    List<Sprite> scene = state.scene;
    scene[state.activeSprite]
            .bitmap[(state.activeFrame * state.height * y) * state.width + x] =
        color;
    emit(state.copyWith(scene: scene));
  }
}
