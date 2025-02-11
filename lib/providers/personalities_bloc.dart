import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:protoapp/data/personalities_repository.dart';
import 'package:protoapp/providers/personalities_event.dart';
import 'package:protoapp/providers/personalities_state.dart';

class PersonalitiesBloc extends Bloc<PersonalitiesEvent, PersonalitiesState> {
  final PersonalitiesRepository repository;

  PersonalitiesBloc(this.repository) : super(PersonalitiesInitial()) {
    on<LoadPersonalities>(_onLoadPersonalities);
    on<AddPersonality>(_onAddPersonality);
    on<EditPersonality>(_onEditPersonality);
    on<DeletePersonality>(_onDeletelPersonality);
  }

  FutureOr<void> _onLoadPersonalities(event, emit) async {
    emit(PersonalitiesLoading());
    try {
      final personalities = await repository.getPersonalities();
      emit(PersonalitiesLoaded(personalities));
    } catch (e) {
      emit(PersonalitiesError('$e'));
    }
  }

  FutureOr<void> _onAddPersonality(event, emit) async {
    try {
      repository.addPersonality(event.name, event.animationData);
      emit(PersonalitiesLoaded(await repository.getPersonalities()));
    } catch (e) {
      emit(PersonalitiesError('$e'));
    }
  }

  FutureOr<void> _onEditPersonality(event, emit) async {
    try {
      repository.updatePersonality(event.id, event.name, event.animationData);
      emit(PersonalitiesLoaded(await repository.getPersonalities()));
    } catch (e) {
      emit(PersonalitiesError('$e'));
    }
  }

  FutureOr<void> _onDeletelPersonality(event, emit) async {
    try {
      repository.deletePersonality(event.id);
      emit(PersonalitiesLoaded(await repository.getPersonalities()));
    } catch (e) {
      emit(PersonalitiesError('$e'));
    }
  }
}
