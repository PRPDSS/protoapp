import 'package:flutter/material.dart';

class Toolbar extends StatelessWidget {
  const Toolbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [Text('TOOLBAR')],
    );
  }
}

Widget _toolBarItem(Icon icon, VoidCallback onTap) {
  return Placeholder();
}
