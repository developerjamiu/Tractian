import 'package:flutter/cupertino.dart';
import 'package:tractian/src/core/theme/app_colors.dart';
import 'package:tractian/src/core/theme/app_typography.dart';
import 'package:tractian/src/presentation/widgets/app_images.dart';

class CompanyListItem extends StatelessWidget {
  const CompanyListItem({
    super.key,
    required this.companyName,
    this.onTap,
  });

  final String companyName;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.lightBlue,
          borderRadius: BorderRadius.circular(8),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 32,
          vertical: 24,
        ),
        child: Row(
          children: [
            AppImages.company(),
            SizedBox(width: 16),
            Text(
              '$companyName Unit',
              style: AppTypography.title,
            ),
          ],
        ),
      ),
    );
  }
}
