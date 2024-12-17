import 'package:flutter/cupertino.dart';
import 'package:tractian/src/core/theme/app_colors.dart';
import 'package:tractian/src/presentation/widgets/app_images.dart';
import 'package:tractian/src/presentation/widgets/company_list_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final mockCompanies = [
      'Jaguar',
      'Tobias',
      'Apex',
    ];

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: AppColors.darkBlue,
        automaticBackgroundVisibility: false,
        middle: AppImages.tractianLogo(),
      ),
      child: ListView.separated(
        separatorBuilder: (context, index) => SizedBox(height: 40),
        padding: EdgeInsets.symmetric(
          vertical: 30,
          horizontal: 20,
        ),
        itemCount: mockCompanies.length,
        itemBuilder: (context, index) => CompanyListItem(
          companyName: mockCompanies[index],
        ),
      ),
    );
  }
}
