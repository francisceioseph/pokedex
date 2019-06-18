class Generation {
  final int id;
  final String name;
  final String englishName;
  final String url;

  Generation({this.id, this.name, this.url, this.englishName});

  Generation.fromJSON(Map<String, dynamic> parsedJson)
      : id = parsedJson['id'],
        name = parsedJson['name'],
        url = parsedJson['url'],
        englishName = _getEnglishNameFromJson(parsedJson);

  Generation.fromDB(Map<String, dynamic> dbMap)
      : id = dbMap['id'],
        name = dbMap['id'],
        url = dbMap['url'],
        englishName = dbMap['englishName'];

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'url': url,
      'englishName': englishName,
    };
  }

  static String _getEnglishNameFromJson(Map<String, dynamic> parsedJson) {
    if (parsedJson['names'] == null) {
      return '';
    }

    final List<dynamic> names = parsedJson['names'];
    final List<dynamic> founds =
        names.where((item) => item['language']['name'] == 'en').first();

    return founds[0]['name'];
  }
}
