import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:protoapp/features/personalities/providers/canvas_state.dart';

class CanvasCubit extends Cubit<CanvasState> {
  CanvasCubit()
      : super(CanvasState(
          activeLayer: 0,
          activeFrame: 0,
          selectedColor: Colors.red,
          height: 16,
          width: 32,
        ));

  void changeActiveLayer(int activeLayer) {
    emit(state.copyWith(activeLayer: activeLayer));
  }

  void changeActiveFrame(int activeFrame) {
    emit(state.copyWith(activeFrame: activeFrame));
  }
}
