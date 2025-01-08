import 'package:protoapp/features/personalities/domain/personality.dart';

abstract class PersonalitiesState {}

class PersonalitiesInitial extends PersonalitiesState {}

class PersonalitiesLoading extends PersonalitiesState {}

class PersonalitiesLoaded extends PersonalitiesState {
  final List<Personality> personalities;
  PersonalitiesLoaded(this.personalities);
}

class PersonalitiesError extends PersonalitiesState {
  final String message;
  PersonalitiesError(this.message);
}
