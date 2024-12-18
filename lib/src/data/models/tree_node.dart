enum NodeType { location, asset, component }

class TreeNode {
  final String id;
  final String name;
  final NodeType type;
  final List<TreeNode> children;
  bool isExpanded;

  TreeNode({
    required this.id,
    required this.name,
    required this.type,
    List<TreeNode>? children,
    this.isExpanded = true,
  }) : children = children ?? [];

  void addChild(TreeNode? child) {
    if (child != null) children.add(child);
  }
}
