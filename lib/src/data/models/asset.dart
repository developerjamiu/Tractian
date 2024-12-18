class Asset {
  final String id;
  final String name;
  final String? locationId;
  final String? parentId;

  const Asset({
    required this.id,
    required this.name,
    this.locationId,
    this.parentId,
  });

  factory Asset.fromJson(Map<String, dynamic> json) {
    return Asset(
      id: json['id'],
      name: json['name'],
      locationId: json['locationId'],
      parentId: json['parentId'],
    );
  }

  static List<Asset> fromArray(List<dynamic> array) {
    return array.map((e) => Asset.fromJson(e)).toList();
  }
}
