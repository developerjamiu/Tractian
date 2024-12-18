import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/cupertino.dart';
import 'package:tractian/src/presentation/widgets/app_empty_view.dart';

void main() {
  group('AppEmptyView', () {
    testWidgets(
      'displays the correct title in the text',
      (WidgetTester tester) async {
        const title = 'Item';

        await tester.pumpWidget(
          AppEmptyViewTestWidget(title: title),
        );

        expect(find.text('No $title found'), findsOneWidget);
      },
    );
  });
}

class AppEmptyViewTestWidget extends StatelessWidget {
  const AppEmptyViewTestWidget({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: CupertinoPageScaffold(
        child: AppEmptyView(title: title),
      ),
    );
  }
}
