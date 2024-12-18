import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tractian/src/presentation/widgets/app_images.dart';

void main() {
  group('AppImages Widget Tests', () {
    testWidgets(
      'renders an SVG image with default properties',
      (tester) async {
        await tester.pumpWidget(
          CupertinoApp(
            home: AppImages.fromName(name: 'tractian_logo.svg'),
          ),
        );

        final svgFinder = find.byType(SvgPicture);
        expect(svgFinder, findsOneWidget);

        final svgWidget = tester.widget<SvgPicture>(svgFinder);
        expect(svgWidget.width, isNull);
        expect(svgWidget.height, isNull);
        expect(svgWidget.fit, BoxFit.cover);
      },
    );

    testWidgets(
      'renders an Image asset with default properties',
      (tester) async {
        await tester.pumpWidget(
          CupertinoApp(
            home: AppImages.fromName(name: 'component.png'),
          ),
        );

        final imageFinder = find.byType(Image);
        expect(imageFinder, findsOneWidget);

        final imageWidget = tester.widget<Image>(imageFinder);
        expect(imageWidget.width, isNull);
        expect(imageWidget.height, isNull);
        expect(imageWidget.fit, BoxFit.cover);
      },
    );

    testWidgets('renders with custom width and height', (tester) async {
      await tester.pumpWidget(
        CupertinoApp(
          home: AppImages.fromName(
            name: 'tractian_logo.svg',
            width: 100,
            height: 50,
          ),
        ),
      );

      final svgFinder = find.byType(SvgPicture);
      expect(svgFinder, findsOneWidget);

      final svgWidget = tester.widget<SvgPicture>(svgFinder);
      expect(svgWidget.width, 100);
      expect(svgWidget.height, 50);
    });

    testWidgets(
      'renders with custom color',
      (tester) async {
        await tester.pumpWidget(
          CupertinoApp(
            home: AppImages.fromName(
              name: 'tractian_logo.svg',
              color: Colors.red,
            ),
          ),
        );

        final svgFinder = find.byType(SvgPicture);
        expect(svgFinder, findsOneWidget);

        final svgWidget = tester.widget<SvgPicture>(svgFinder);
        expect(svgWidget.colorFilter, isNotNull);
      },
    );

    testWidgets(
      'renders an SVG using factory constructor',
      (tester) async {
        await tester.pumpWidget(
          CupertinoApp(
            home: AppImages.tractianLogo(
              width: 200,
              height: 100,
            ),
          ),
        );

        final svgFinder = find.byType(SvgPicture);
        expect(svgFinder, findsOneWidget);

        final svgWidget = tester.widget<SvgPicture>(svgFinder);
        expect(svgWidget.width, 200);
        expect(svgWidget.height, 100);
      },
    );

    testWidgets(
      'renders a PNG using factory constructor',
      (tester) async {
        await tester.pumpWidget(
          CupertinoApp(
            home: AppImages.component(
              width: 150,
              height: 75,
            ),
          ),
        );

        final imageFinder = find.byType(Image);
        expect(imageFinder, findsOneWidget);

        final imageWidget = tester.widget<Image>(imageFinder);
        expect(imageWidget.width, 150);
        expect(imageWidget.height, 75);
      },
    );

    testWidgets(
      'uses BoxFit.cover by default',
      (tester) async {
        await tester.pumpWidget(
          CupertinoApp(
            home: AppImages.energy(),
          ),
        );

        final svgFinder = find.byType(SvgPicture);
        expect(svgFinder, findsOneWidget);

        final svgWidget = tester.widget<SvgPicture>(svgFinder);
        expect(svgWidget.fit, BoxFit.cover);
      },
    );

    testWidgets(
      'applies custom BoxFit',
      (tester) async {
        await tester.pumpWidget(
          CupertinoApp(
            home: AppImages.energy(fit: BoxFit.contain),
          ),
        );

        final svgFinder = find.byType(SvgPicture);
        expect(svgFinder, findsOneWidget);

        final svgWidget = tester.widget<SvgPicture>(svgFinder);
        expect(svgWidget.fit, BoxFit.contain);
      },
    );

    testWidgets(
      'renders an asset with the correct key',
      (tester) async {
        const assetName = 'energy.svg';
        await tester.pumpWidget(
          CupertinoApp(
            home: AppImages.fromName(name: assetName),
          ),
        );

        expect(find.byKey(Key('AppImage-$assetName')), findsOneWidget);
      },
    );
  });
}
