import 'package:flutter/cupertino.dart';
import 'package:tractian/src/core/theme/app_typography.dart';
import 'package:tractian/src/data/models/tree_node.dart';
import 'package:tractian/src/presentation/widgets/app_images.dart';

class TreeNodeWidget extends StatefulWidget {
  final TreeNode node;

  const TreeNodeWidget({
    super.key,
    required this.node,
  });

  @override
  State<TreeNodeWidget> createState() => _TreeNodeWidgetState();
}

class _TreeNodeWidgetState extends State<TreeNodeWidget> {
  late bool isExpanded =
      widget.node.isExpanded && widget.node.children.length < 4;
  late final node = widget.node;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () => setState(() => isExpanded = !isExpanded),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                node.children.isNotEmpty
                    ? AnimatedRotation(
                        duration: Duration(milliseconds: 200),
                        turns: isExpanded ? 1 : 0.75,
                        child: AppImages.treeSwitcher(),
                      )
                    : const SizedBox(width: 24),
                getIcon(node.type),
                const SizedBox(width: 8),
                Text(
                  node.name,
                  style: AppTypography.body,
                ),
              ],
            ),
          ),
        ),
        if (isExpanded)
          Padding(
            padding: const EdgeInsets.only(left: 22),
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: node.children.length,
              itemBuilder: (context, index) => TreeNodeWidget(
                node: node.children[index],
              ),
            ),
          ),
      ],
    );
  }
}

Widget getIcon(NodeType nodeType) {
  switch (nodeType) {
    case NodeType.location:
      return AppImages.location();
    case NodeType.asset:
      return AppImages.asset();
    case NodeType.component:
      return AppImages.component(
        height: 22,
        width: 22,
      );
  }
}
