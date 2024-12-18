import 'package:tractian/src/core/extensions/iterable_extension.dart';

enum Status {
  operating,
  alert;

  static Status? fromString(String? status) => Status.values.firstWhereOrNull(
        (e) => e.name == status,
      );
}

enum SensorType {
  vibration,
  energy;

  static SensorType fromString(String type) => SensorType.values.firstWhere(
        (e) => e.name == type,
      );
}

class Component {
  final String id;
  final String name;
  final SensorType sensorType;
  final Status? status;
  final String? parentId;
  final String? locationId;

  const Component({
    required this.id,
    required this.name,
    required this.sensorType,
    required this.status,
    this.parentId,
    this.locationId,
  });

  factory Component.fromJson(Map<String, dynamic> json) {
    return Component(
      id: json['id'],
      name: json['name'],
      sensorType: SensorType.fromString(json['sensorType']),
      status: Status.fromString(json['status']),
      parentId: json['parentId'],
      locationId: json['locationId'],
    );
  }

  static List<Component> fromArray(List<dynamic> array) {
    return array.map((e) => Component.fromJson(e)).toList();
  }
}
