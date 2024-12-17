import 'package:flutter/cupertino.dart';

class CompaniesLoadingView extends StatelessWidget {
  const CompaniesLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CupertinoActivityIndicator(),
    );
  }
}
