import 'package:protoapp/domain/models/layer.dart';

class Frame {
  final int width;
  final int height;
  final List<Layer> layers;

  Frame({
    required this.width,
    required this.height,
    List<Layer>? layers,
  }) : layers = layers ?? [Layer(width: width, height: height)];

  /// Копирует кадр с новыми параметрами
  Frame copyWith({
    int? width,
    int? height,
    List<Layer>? layers,
  }) {
    return Frame(
      width: width ?? this.width,
      height: height ?? this.height,
      layers: layers ?? this.layers,
    );
  }
}
