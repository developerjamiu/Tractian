import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tractian/src/presentation/widgets/app_loading_view.dart';

void main() {
  group('AppLoadingView Widget Tests', () {
    testWidgets('renders a CupertinoActivityIndicator', (tester) async {
      await tester.pumpWidget(
        AppLoadingViewTestWidget(),
      );

      expect(find.byType(CupertinoActivityIndicator), findsOneWidget);
    });

    testWidgets('is centered within its parent', (tester) async {
      await tester.pumpWidget(
        AppLoadingViewTestWidget(),
      );

      // Assert
      final centerFinder = find.byType(Center);
      expect(centerFinder, findsOneWidget);

      final centerWidget = tester.widget<Center>(centerFinder);
      expect(centerWidget.child, isA<CupertinoActivityIndicator>());
    });
  });
}

class AppLoadingViewTestWidget extends StatelessWidget {
  const AppLoadingViewTestWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: CupertinoPageScaffold(
        child: AppLoadingView(),
      ),
    );
  }
}
