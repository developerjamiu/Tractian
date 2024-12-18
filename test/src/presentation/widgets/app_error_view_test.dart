import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/cupertino.dart';
import 'package:tractian/src/presentation/widgets/app_error_view.dart';

void main() {
  group(
    'AppErrorView',
    () {
      testWidgets(
        'displays the provided errorMessage',
        (WidgetTester tester) async {
          const errorMessage = 'Something went wrong!';

          await tester.pumpWidget(
            AppErrorViewTestWidget(
              errorMessage: errorMessage,
            ),
          );

          expect(find.text(errorMessage), findsOneWidget);
        },
      );

      testWidgets(
        'displays default errorMessage when no errorMessage is provided',
        (WidgetTester tester) async {
          await tester.pumpWidget(
            AppErrorViewTestWidget(
              errorMessage: null,
            ),
          );

          expect(find.text('An error occured'), findsOneWidget);
        },
      );

      testWidgets(
        'displays the "Try again" button',
        (WidgetTester tester) async {
          const errorMessage = 'Something went wrong!';

          await tester.pumpWidget(
            AppErrorViewTestWidget(
              errorMessage: errorMessage,
            ),
          );

          final retryButtonFinder = find.widgetWithText(
            CupertinoButton,
            'Try again',
          );

          expect(retryButtonFinder, findsOneWidget);
        },
      );

      testWidgets(
        'triggers onRetry when the "Try again" button is pressed',
        (WidgetTester tester) async {
          const errorMessage = 'Network error';
          bool retryTriggered = false;

          await tester.pumpWidget(
            AppErrorViewTestWidget(
              errorMessage: errorMessage,
              onRetry: () {
                retryTriggered = true;
              },
            ),
          );

          final retryButtonFinder = find.widgetWithText(
            CupertinoButton,
            'Try again',
          );
          await tester.tap(retryButtonFinder);
          await tester.pump();

          expect(retryTriggered, isTrue);
        },
      );

      testWidgets(
        'widget is properly centered on the screen',
        (WidgetTester tester) async {
          await tester.pumpWidget(
            AppErrorViewTestWidget(
              errorMessage: null,
            ),
          );

          final columnFinder = find.byType(Column);

          final columnWidget = tester.widget<Column>(columnFinder);
          final mainAxisAlignment = columnWidget.mainAxisAlignment;

          expect(
            mainAxisAlignment,
            equals(MainAxisAlignment.center),
          );
        },
      );
    },
  );
}

class AppErrorViewTestWidget extends StatelessWidget {
  const AppErrorViewTestWidget({
    super.key,
    required this.errorMessage,
    this.onRetry,
  });

  final String? errorMessage;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: CupertinoPageScaffold(
        child: AppErrorView(
          errorMessage: errorMessage,
          onRetry: onRetry,
        ),
      ),
    );
  }
}
