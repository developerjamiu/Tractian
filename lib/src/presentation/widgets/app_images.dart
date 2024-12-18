import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppImages extends StatelessWidget {
  final String assetName;
  final double? width;
  final double? height;
  final BoxFit fit;
  final Color? color;

  const AppImages._({
    required this.assetName,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final key = Key('AppImage-$assetName');
    final color = this.color;

    if (assetName.endsWith('.svg')) {
      return SvgPicture.asset(
        'assets/images/$assetName',
        key: key,
        width: width,
        height: height,
        fit: fit,
        colorFilter:
            color != null ? ColorFilter.mode(color, BlendMode.srcIn) : null,
      );
    }

    return Image.asset(
      'assets/images/$assetName',
      width: width,
      height: height,
      key: key,
      fit: fit,
      color: color,
    );
  }

  factory AppImages.fromName({
    required String name,
    double? width,
    double? height,
    Color? color,
  }) =>
      AppImages._(
        assetName: name,
        width: width,
        height: height,
        color: color,
      );

  factory AppImages.asset({
    double? width,
    double? height,
    BoxFit fit = BoxFit.cover,
  }) =>
      AppImages._(
        assetName: 'asset.svg',
        width: width,
        height: height,
        fit: fit,
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

  factory AppImages.component({
    double? width,
    double? height,
    BoxFit fit = BoxFit.cover,
  }) =>
      AppImages._(
        assetName: 'component.png',
        width: width,
        height: height,
        fit: fit,
      );

  factory AppImages.critical({
    double? width,
    double? height,
    BoxFit fit = BoxFit.cover,
  }) =>
      AppImages._(
        assetName: 'critical.svg',
        width: width,
        height: height,
        fit: fit,
      );

  factory AppImages.criticio({
    double? width,
    double? height,
    BoxFit fit = BoxFit.cover,
  }) =>
      AppImages._(
        assetName: 'criticio.svg',
        width: width,
        height: height,
        fit: fit,
      );

  factory AppImages.energy({
    double? width,
    double? height,
    BoxFit fit = BoxFit.cover,
  }) =>
      AppImages._(
        assetName: 'energy.svg',
        width: width,
        height: height,
        fit: fit,
      );

  factory AppImages.location({
    double? width,
    double? height,
    BoxFit fit = BoxFit.cover,
  }) =>
      AppImages._(
        assetName: 'location.svg',
        width: width,
        height: height,
        fit: fit,
      );

  factory AppImages.operating({
    double? width,
    double? height,
    BoxFit fit = BoxFit.cover,
  }) =>
      AppImages._(
        assetName: 'operating.svg',
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

  factory AppImages.treeSwitcher({
    double? width,
    double? height,
    BoxFit fit = BoxFit.cover,
  }) =>
      AppImages._(
        assetName: 'tree_switcher.svg',
        width: width,
        height: height,
        fit: fit,
      );
}
