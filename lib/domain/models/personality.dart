class Personality {
  final int id;
  final String name;
  final String animationData;

  Personality(
      {required this.id, required this.name, required this.animationData});

  factory Personality.fromMap(Map<String, dynamic> map) {
    return Personality(
      id: map['id'] as int,
      name: map['name'] as String,
      animationData: map['animationData'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'animationData': animationData,
    };
  }
}
