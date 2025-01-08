import 'package:protoapp/features/personalities/domain/personality.dart';
import 'package:sqflite/sqlite_api.dart';

class PersonalitiesRepository {
  final Database database;
  PersonalitiesRepository(this.database);

  Future<List<Personality>> getPersonalities() async {
    final List<Map<String, dynamic>> presonalityMaps =
        await database.query('personalities');
    return presonalityMaps.map((p) => Personality.fromMap(p)).toList();
  }

  Future<void> addPersonality(String name, String animationData) async {
    await database.insert('personalities', {
      'name': name,
      'animationData': animationData,
    });
  }

  Future<void> updatePersonality(
      int id, String? name, String? animationData) async {
    final values = <String, dynamic>{};
    if (name != null) values['name'] = name;
    if (animationData != null) values['animationData'] = animationData;

    await database.update(
      'personalities',
      values,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> deletePersonality(int id) async {
    await database.delete(
      'personalities',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
