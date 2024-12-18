import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tractian/src/core/theme/app_colors.dart';
import 'package:tractian/src/presentation/widgets/asset_filter.dart';
import 'package:tractian/src/presentation/widgets/app_images.dart';

void main() {
  group('AssetFilter Widget Tests', () {
    testWidgets(
      'renders correctly with default isSelected = true',
      (tester) async {
        const testAssetName = 'energy.svg';
        const testTitle = 'Test Title';

        await tester.pumpWidget(
          AssetFilterTestWidget(
            assetName: testAssetName,
            title: testTitle,
          ),
        );

        expect(find.byType(AppImages), findsOneWidget);
        expect(find.text(testTitle), findsOneWidget);

        final decoratedBox = tester.widget<DecoratedBox>(
          find.descendant(
            of: find.byType(AssetFilter),
            matching: find.byType(DecoratedBox),
          ),
        );
        expect(decoratedBox.decoration, isA<BoxDecoration>());
        final boxDecoration = decoratedBox.decoration as BoxDecoration;
        expect(boxDecoration.color, AppColors.lightBlue);

        final text = tester.widget<Text>(find.text(testTitle));
        expect(text.style?.color, AppColors.white);
      },
    );

    testWidgets('renders correctly when isSelected = false', (tester) async {
      const testAssetName = 'energy.svg';
      const testTitle = 'Test Title';

      await tester.pumpWidget(
        AssetFilterTestWidget(
          assetName: testAssetName,
          title: testTitle,
          isSelected: false,
        ),
      );

      final decoratedBox = tester.widget<DecoratedBox>(
        find.descendant(
          of: find.byType(AssetFilter),
          matching: find.byType(DecoratedBox),
        ),
      );
      expect(decoratedBox.decoration, isA<BoxDecoration>());
      final boxDecoration = decoratedBox.decoration as BoxDecoration;
      expect(boxDecoration.color, isNull);
      expect(boxDecoration.border, isNotNull);
      expect(boxDecoration.border?.top.color, AppColors.lightGray);
    });

    testWidgets('triggers onTap callback when tapped', (tester) async {
      bool tapped = false;
      const testAssetName = 'energy.svg';
      const testTitle = 'Test Title';

      await tester.pumpWidget(
        AssetFilterTestWidget(
          assetName: testAssetName,
          title: testTitle,
          onTap: () {
            tapped = true;
          },
        ),
      );

      expect(tapped, isFalse);
      await tester.tap(find.byType(AssetFilter));
      await tester.pumpAndSettle();
      expect(tapped, isTrue);
    });

    testWidgets(
      'AppImages renders with correct parameters based on isSelected',
      (tester) async {
        const testAssetName = 'energy.svg';
        const testTitle = 'Test Title';

        await tester.pumpWidget(
          AssetFilterTestWidget(
            assetName: testAssetName,
            title: testTitle,
            isSelected: true,
          ),
        );

        final appImage = tester.widget<AppImages>(find.byType(AppImages));
        expect(appImage.assetName, testAssetName);
        expect(appImage.color, AppColors.white);

        await tester.pumpWidget(
          AssetFilterTestWidget(
            assetName: testAssetName,
            title: testTitle,
            isSelected: false,
          ),
        );

        final appImageNotSelected = tester.widget<AppImages>(
          find.byType(AppImages),
        );
        expect(appImageNotSelected.assetName, testAssetName);
        expect(appImageNotSelected.color, isNull);
      },
    );
  });
}

class AssetFilterTestWidget extends StatelessWidget {
  const AssetFilterTestWidget({
    super.key,
    required this.assetName,
    required this.title,
    this.isSelected = true,
    this.onTap,
  });

  final String assetName;
  final String title;
  final bool isSelected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: CupertinoPageScaffold(
        child: AssetFilter(
          assetName: assetName,
          title: title,
          isSelected: isSelected,
          onTap: onTap,
        ),
      ),
    );
  }
}
