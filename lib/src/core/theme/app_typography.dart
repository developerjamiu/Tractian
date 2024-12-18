import 'package:flutter/cupertino.dart';
import 'package:tractian/src/core/theme/app_colors.dart';

class AppTypography {
  AppTypography._();

  static const title = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: AppColors.white,
  );

  static const body = TextStyle(
    fontSize: 14,
  );

  static const body2 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.text,
  );
}
