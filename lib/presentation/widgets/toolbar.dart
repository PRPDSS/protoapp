import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class Toolbar extends StatelessWidget {
  final Function(Color color) onColorSelected;
  final Function() onEraserSelected;
  final Color selectedColor;

  const Toolbar({
    required this.onColorSelected,
    required this.onEraserSelected,
    required this.selectedColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text('TOOLBAR'),
        _toolBarItem(Icon(Icons.draw), () {}),
        _toolBarItem(
          Icon(Icons.radio_button_unchecked_rounded),
          () {
            onEraserSelected();
          },
        ),
        _toolBarItem(
          Icon(Icons.palette),
          () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text('Pick a color!'),
                  content: Expanded(
                    child: Column(
                      children: [
                        ColorPicker(
                          pickerColor: selectedColor,
                          onColorChanged: onColorSelected,
                          enableAlpha: true,
                          portraitOnly: true,
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ],
    );
  }
}

Widget _toolBarItem(Icon icon, VoidCallback onTap) {
  return IconButton(onPressed: onTap, icon: icon);
}
