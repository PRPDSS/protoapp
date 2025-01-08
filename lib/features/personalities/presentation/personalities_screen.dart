import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:protoapp/database/database_service.dart';
import 'package:protoapp/features/personalities/data/personalities_repository.dart';
import 'package:protoapp/features/personalities/presentation/widgets/personality_card.dart';
import 'package:protoapp/features/personalities/providers/personalities_bloc.dart';
import 'package:protoapp/features/personalities/providers/personalities_event.dart';
import 'package:protoapp/features/personalities/providers/personalities_state.dart';

class PersonalitiesScreen extends StatelessWidget {
  const PersonalitiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initDependencies(), // Асинхронная инициализация базы
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        final repository = snapshot.data as PersonalitiesRepository;

        return RepositoryProvider.value(
          value: repository,
          child: BlocProvider(
            create: (context) =>
                PersonalitiesBloc(repository)..add(LoadPersonalities()),
            child: Scaffold(
              appBar: AppBar(
                title: const Text("Personalities"),
                actions: const [
                  IconButton(
                    onPressed: DoNothingAction.new,
                    icon: Icon(Icons.settings),
                  )
                ],
              ),
              body: BlocBuilder<PersonalitiesBloc, PersonalitiesState>(
                builder: (context, state) {
                  if (state is PersonalitiesLoaded) {
                    return ListView.builder(
                      itemCount: state.personalities.length,
                      itemBuilder: (context, index) => PersonalityCard(),
                    );
                  } else {
                    return Placeholder();
                  }
                },
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: () =>
                    Navigator.restorablePushNamed(context, '/creator'),
                child: const Icon(Icons.create),
              ),
            ),
          ),
        );
      },
    );
  }

  Future<PersonalitiesRepository> _initDependencies() async {
    final database = await DatabaseService.database; // Создаём базу
    return PersonalitiesRepository(database); // Создаём репозиторий
  }
}
