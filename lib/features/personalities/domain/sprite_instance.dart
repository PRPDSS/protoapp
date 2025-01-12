import 'package:protoapp/features/personalities/domain/sprite.dart';

/// Хранит в с ебе sprite и положение его верхнего левого пикселя (начиная отсчет с 0)
class SpriteInstance {
  final Sprite sprite;
  int posX;
  int posY;
  int zIndex;

  SpriteInstance(this.sprite, this.posX, this.posY, {this.zIndex = 0});

  Map<String, dynamic> toJsonMap() {
    return {
      'posX': posX,
      'posY': posY,
      'zIndex': zIndex,
      'sprite': sprite.toJsonMap(),
    };
  }
}
