import 'package:flutter/material.dart';

class Pixel extends StatelessWidget {
  final Color color;
  const Pixel(this.color, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(height: 1, width: 1, color: color);
  }
}
