import 'package:tractian/src/data/models/component.dart';

enum NodeType { location, asset, component }

class TreeNode {
  final String id;
  final String name;
  final NodeType type;
  final List<TreeNode> children;

  bool isExpanded;
  SensorType? sensorType;
  Status? status;

  TreeNode({
    List<TreeNode>? children,
    required this.id,
    required this.name,
    required this.type,
    this.isExpanded = true,
    this.sensorType,
    this.status,
  }) : children = children ?? [];

  void addChild(TreeNode? child) {
    if (child != null) children.add(child);
  }
}
