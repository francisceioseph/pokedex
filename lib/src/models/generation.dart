class Generation {
  final int id;
  final String name;

  Generation({this.id, this.name});

  Generation.fromJSON(Map<String, dynamic> parsedJson)
      : id = parsedJson['id'],
        name = parsedJson['name'];

  Generation.fromDB(Map<String, dynamic> dbMap)
      : id = dbMap['id'],
        name = dbMap['id'];

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }
}
