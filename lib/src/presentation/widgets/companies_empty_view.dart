import 'package:flutter/cupertino.dart';

class CompaniesEmptyView extends StatelessWidget {
  const CompaniesEmptyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('No companies found'),
    );
  }
}
