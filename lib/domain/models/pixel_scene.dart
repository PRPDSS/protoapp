import 'package:protoapp/domain/models/frame.dart';

class PixelScene {
  final int width;
  final int height;
  final List<Frame> frames;
  final int currentFrameIndex;
  final int currentLayerIndex;

  PixelScene({
    required this.width,
    required this.height,
    List<Frame>? frames,
    this.currentFrameIndex = 0,
    this.currentLayerIndex = 0,
  }) : frames = frames ?? [Frame(width: width, height: height)];

  /// Копирует проект с новыми параметрами
  PixelScene copyWith({
    int? width,
    int? height,
    List<Frame>? frames,
    int? currentFrameIndex,
    int? currentLayerIndex,
  }) {
    return PixelScene(
      width: width ?? this.width,
      height: height ?? this.height,
      frames: frames ?? this.frames,
      currentFrameIndex: currentFrameIndex ?? this.currentFrameIndex,
      currentLayerIndex: currentLayerIndex ?? this.currentLayerIndex,
    );
  }
}
