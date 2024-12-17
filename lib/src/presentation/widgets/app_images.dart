import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppImages extends StatelessWidget {
  final String assetName;
  final double? width;
  final double? height;
  final BoxFit fit;

  const AppImages._({
    required this.assetName,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
  });

  @override
  Widget build(BuildContext context) {
    final key = Key('AppImage-$assetName');

    if (assetName.endsWith('.svg')) {
      return SvgPicture.asset(
        'assets/images/$assetName',
        key: key,
        width: width,
        height: height,
        fit: fit,
      );
    }

    return Image.asset(
      'assets/images/$assetName',
      width: width,
      height: height,
      key: key,
      fit: fit,
    );
  }

  factory AppImages.fromName({
    required String name,
    double? width,
    double? height,
  }) =>
      AppImages._(
        assetName: name,
        width: width,
        height: height,
      );

  factory AppImages.company({
    double? width,
    double? height,
    BoxFit fit = BoxFit.cover,
  }) =>
      AppImages._(
        assetName: 'company.svg',
        width: width,
        height: height,
        fit: fit,
      );

  factory AppImages.tractianLogo({
    double? width,
    double? height,
    BoxFit fit = BoxFit.cover,
  }) =>
      AppImages._(
        assetName: 'tractian_logo.svg',
        width: width,
        height: height,
        fit: fit,
      );
}
