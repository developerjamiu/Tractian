import 'package:flutter/cupertino.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:tractian/src/core/theme/app_colors.dart';
import 'package:tractian/src/data/repositories/companies_repository.dart';
import 'package:tractian/src/presentation/state/companies_store.dart';
import 'package:tractian/src/presentation/widgets/app_images.dart';
import 'package:tractian/src/presentation/widgets/companies_empty_view.dart';
import 'package:tractian/src/presentation/widgets/companies_error_view.dart';
import 'package:tractian/src/presentation/widgets/companies_list_view.dart';
import 'package:tractian/src/presentation/widgets/companies_loading_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider<CompaniesStore>(
      create: (context) => CompaniesStore(
        companiesRepository: context.read<CompaniesRepository>(),
      )..fetchCompanies(),
      child: HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final companiesStore = context.read<CompaniesStore>();

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: AppColors.darkBlue,
        automaticBackgroundVisibility: false,
        middle: AppImages.tractianLogo(),
      ),
      child: Observer(
        builder: (context) {
          if (companiesStore.state == CompaniesStoreState.loading) {
            return CompaniesLoadingView();
          } else if (companiesStore.state == CompaniesStoreState.error) {
            return CompaniesErrorView(
              errorMessage: companiesStore.errorMessage,
              onRetry: companiesStore.fetchCompanies,
            );
          } else if (companiesStore.companies.isEmpty) {
            return CompaniesEmptyView();
          } else {
            return CompaniesListView(
              companies: companiesStore.companies,
            );
          }
        },
      ),
    );
  }
}
