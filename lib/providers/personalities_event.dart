abstract class PersonalitiesEvent {}

class LoadPersonalities extends PersonalitiesEvent {}

class AddPersonality extends PersonalitiesEvent {
  final String name;
  final String animationData;
  AddPersonality(this.name, this.animationData);
}

class EditPersonality extends PersonalitiesEvent {
  final int id;
  final String? name;
  final String? animationData;
  EditPersonality(this.id, {this.name, this.animationData});
}

class DeletePersonality extends PersonalitiesEvent {
  final int id;
  DeletePersonality(this.id);
}
