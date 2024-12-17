import 'package:flutter/cupertino.dart';
import 'package:tractian/src/data/models/company.dart';
import 'package:tractian/src/presentation/widgets/company_list_item.dart';

class CompaniesListView extends StatelessWidget {
  const CompaniesListView({
    super.key,
    required this.companies,
  });

  final List<Company> companies;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => SizedBox(height: 40),
      padding: EdgeInsets.symmetric(
        vertical: 30,
        horizontal: 20,
      ),
      itemCount: companies.length,
      itemBuilder: (context, index) => CompanyListItem(
        companyName: companies[index].name,
      ),
    );
  }
}
