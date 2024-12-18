import 'package:flutter/cupertino.dart';
import 'package:tractian/src/data/models/tree_node.dart';
import 'package:tractian/src/presentation/widgets/tree_node_widget.dart';

class AssetsTreeView extends StatelessWidget {
  const AssetsTreeView({
    super.key,
    required this.rootNodes,
  });

  final List<TreeNode> rootNodes;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: rootNodes.length,
      itemBuilder: (context, index) {
        return TreeNodeWidget(
          key: ValueKey(rootNodes[index].id),
          node: rootNodes[index],
        );
      },
    );
  }
}
