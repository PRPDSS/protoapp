import 'package:flutter/material.dart';
import 'package:protoapp/domain/models/pixel_scene.dart';
import 'package:protoapp/presentation/widgets/pixel_grid.dart';
import 'package:protoapp/presentation/widgets/timeline.dart';
import 'package:protoapp/presentation/widgets/toolbar.dart';

class EditorScreen extends StatefulWidget {
  const EditorScreen({super.key});

  @override
  State<EditorScreen> createState() => _EditorScreenState();
}

class _EditorScreenState extends State<EditorScreen> {
  late PixelScene scene;
  late Color selectedColor;

  @override
  void initState() {
    super.initState();
    scene = PixelScene(width: 32, height: 16);
    selectedColor = Colors.black;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: Column(
        children: [
          Toolbar(
            selectedColor: selectedColor,
            onColorSelected: (color) {
              setState(
                () {
                  selectedColor = color;
                },
              );
            },
            onEraserSelected: () {
              setState(
                () {
                  selectedColor = Colors.transparent;
                },
              );
            },
          ),
          Expanded(
            child: PixelGrid(
              scene: scene,
              onPixelTapped: (x, y) {
                // Обработка нажатия на пиксель
                final currentFrame = scene.frames[scene.currentFrameIndex];
                final currentLayer =
                    currentFrame.layers[scene.currentLayerIndex];
                setState(() {
                  currentLayer.pixels[y][x] = selectedColor;
                  print(currentLayer.pixels);
                });
              },
            ),
          ),
        Timeline(
            frames: scene.frames,
            currentFrameIndex: scene.currentFrameIndex,
            onFrameSelected: (index) {
              setState(
                () {
                  scene = scene.copyWith(currentFrameIndex: index);
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
