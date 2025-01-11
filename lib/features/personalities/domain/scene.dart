import 'package:protoapp/features/personalities/domain/sprite_instance.dart';

class Scene {
  final List<SpriteInstance> spriteInstances;
  const Scene(this.spriteInstances);

  factory Scene.empty() {
    return Scene(List<SpriteInstance>.empty());
  }
}
