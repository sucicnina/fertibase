
class Translation {
  final String locale;
  final String name;
  final String description;

  Translation({required this.locale, required this.name, required this.description});

  factory Translation.fromJson(Map<String, dynamic> j) => Translation(
        locale: j['locale']?.toString() ?? '',
        name: j['name']?.toString() ?? '',
        description: j['description']?.toString() ?? '',
      );
}
