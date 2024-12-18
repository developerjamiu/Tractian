class Location {
  final String id;
  final String name;
  final String? parentId;

  const Location({
    required this.id,
    required this.name,
    this.parentId,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      id: json['id'],
      name: json['name'],
      parentId: json['parentId'],
    );
  }

  static List<Location> fromArray(List<dynamic> array) {
    return array.map((e) => Location.fromJson(e)).toList();
  }
}
