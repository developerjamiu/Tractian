import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tractian/src/data/models/tree_node.dart';
import 'package:tractian/src/presentation/widgets/assets_tree_view.dart';
import 'package:tractian/src/presentation/widgets/tree_node_widget.dart';

void main() {
  group('AssetsTreeView', () {
    testWidgets(
      'renders correctly with multiple rootNodes',
      (WidgetTester tester) async {
        final mockTreeNodes = [
          TreeNode(
            id: '1',
            name: 'Node 1',
            children: [],
            type: NodeType.location,
          ),
          TreeNode(
            id: '2',
            name: 'Node 2',
            children: [],
            type: NodeType.asset,
          ),
          TreeNode(
            id: '3',
            name: 'Node 3',
            children: [],
            type: NodeType.component,
          ),
        ];

        await tester.pumpWidget(
          AssetsTreeViewTestWidget(rootNodes: mockTreeNodes),
        );

        expect(find.byType(ListView), findsNWidgets(4));

        expect(
          find.byType(TreeNodeWidget),
          findsNWidgets(mockTreeNodes.length),
        );

        for (final node in mockTreeNodes) {
          expect(
            find.byKey(ValueKey(node.id)),
            findsOneWidget,
          );
        }
      },
    );

    testWidgets(
      'renders correctly with no rootNodes',
      (WidgetTester tester) async {
        final mockTreeNodes = <TreeNode>[];

        await tester.pumpWidget(
          AssetsTreeViewTestWidget(rootNodes: mockTreeNodes),
        );

        expect(find.byType(ListView), findsOneWidget);

        expect(find.byType(TreeNodeWidget), findsNothing);
      },
    );

    testWidgets(
      'displays TreeNodeWidget with the correct data',
      (WidgetTester tester) async {
        final mockTreeNodes = [
          TreeNode(
            id: '1',
            name: 'Node 1',
            children: [],
            type: NodeType.location,
          ),
          TreeNode(
            id: '2',
            name: 'Node 2',
            children: [],
            type: NodeType.location,
          ),
        ];

        await tester.pumpWidget(
          AssetsTreeViewTestWidget(rootNodes: mockTreeNodes),
        );

        for (final node in mockTreeNodes) {
          expect(find.text(node.name), findsOneWidget);
        }
      },
    );
  });
}

class AssetsTreeViewTestWidget extends StatelessWidget {
  const AssetsTreeViewTestWidget({
    super.key,
    required this.rootNodes,
  });

  final List<TreeNode> rootNodes;

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: CupertinoPageScaffold(
        child: AssetsTreeView(
          rootNodes: rootNodes,
        ),
      ),
    );
  }
}
