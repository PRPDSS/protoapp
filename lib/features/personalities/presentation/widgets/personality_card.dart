import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:protoapp/features/personalities/domain/personality.dart';
import 'package:protoapp/features/personalities/providers/personalities_bloc.dart';
import 'package:protoapp/features/personalities/providers/personalities_event.dart';

class PersonalityCard extends StatelessWidget {
  final Personality personality;
  const PersonalityCard(this.personality, {super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<PersonalitiesBloc>(context);
    return Card(
      margin: EdgeInsets.all(12),
      color: Theme.of(context).colorScheme.surfaceContainer,
      child: InkWell(
        splashColor: Theme.of(context).colorScheme.surfaceContainerHighest,
        child: Column(
          children: [
            SizedBox(
              height: 180,
              child: Stack(
                children: [
                  Positioned.fill(child: Placeholder()),
                  Positioned(
                    left: 4,
                    bottom: 4,
                    child: Container(
                      padding: EdgeInsets.all(4),
                      color: Theme.of(context).colorScheme.primaryContainer,
                      child: Text(
                        personality.name,
                        style: TextStyle(
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimaryContainer),
                      ),
                    ),
                  )
                ],
              ),
            ),
            OverflowBar(
              alignment: MainAxisAlignment.end,
              spacing: 6,
              children: [
                TextButton(
                  onPressed: () =>
                      {bloc.add(DeletePersonality(personality.id))},
                  child: Text('delete'),
                ),
                TextButton(
                  onPressed: () => {},
                  child: Text('edit'),
                ),
                TextButton(
                  onPressed: () => {},
                  child: Text('apply'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
