import 'package:flutter/cupertino.dart';
import 'package:tractian/src/core/theme/app_colors.dart';
import 'package:tractian/src/core/theme/app_typography.dart';
import 'package:tractian/src/presentation/widgets/app_images.dart';

class AssetFilter extends StatelessWidget {
  const AssetFilter({
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
    return GestureDetector(
      onTap: onTap,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: isSelected ? AppColors.lightBlue : null,
          borderRadius: BorderRadius.circular(4),
          border: isSelected ? null : Border.all(color: AppColors.lightGray),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppImages.fromName(
                name: assetName,
                color: isSelected ? AppColors.white : null,
              ),
              SizedBox(width: 4),
              Text(
                title,
                style: AppTypography.body2.copyWith(
                  color: isSelected ? AppColors.white : null,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
