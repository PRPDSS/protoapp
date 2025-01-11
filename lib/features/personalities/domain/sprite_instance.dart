import 'package:protoapp/features/personalities/domain/sprite.dart';

/// Хранит в с ебе sprite и положение его верхнего левого пикселя (начиная отсчет с 0)
class SpriteInstance {
  final Sprite sprite;
  final int posX;
  final int posY;
  final int zIndex;

  const SpriteInstance(this.sprite, this.posX, this.posY, {this.zIndex = 0});
}