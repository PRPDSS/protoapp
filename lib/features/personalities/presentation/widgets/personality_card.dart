import 'package:flutter/material.dart';

class PersonalityCard extends StatelessWidget {
  const PersonalityCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        margin: EdgeInsets.all(8),
        child: Container(
          height: 80,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surfaceContainer,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      onTap: () => DoNothingAction.new,
      onLongPress: () => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('COCAL??'),
        ),
      ),
    );
  }
}
