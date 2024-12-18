import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:tractian/src/core/theme/app_colors.dart';
import 'package:tractian/src/core/theme/app_typography.dart';
import 'package:tractian/src/data/repositories/companies_repository.dart';
import 'package:tractian/src/presentation/state/assets_store.dart';
import 'package:tractian/src/presentation/widgets/tree_node_widget.dart';

class AssetsPage extends StatelessWidget {
  const AssetsPage({
    super.key,
    required this.companyId,
  });

  final String companyId;

  @override
  Widget build(BuildContext context) {
    return Provider<AssetsStore>(
      create: (context) => AssetsStore(
        companiesRepository: context.read<CompaniesRepository>(),
        companyId: companyId,
      )..initializeAssets(),
      child: AssetsView(),
    );
  }
}

class AssetsView extends StatelessWidget {
  const AssetsView({super.key});

  @override
  Widget build(BuildContext context) {
    final assetsStore = context.read<AssetsStore>();

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        automaticBackgroundVisibility: false,
        backgroundColor: AppColors.darkBlue,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(
            CupertinoIcons.chevron_back,
            color: AppColors.white,
          ),
        ),
        middle: Text(
          'Assets',
          style: AppTypography.title,
        ),
      ),
      child: Observer(
        builder: (context) {
          if (assetsStore.state == AssetsStoreState.loading) {
            return Center(
              child: CupertinoActivityIndicator(),
            );
          }

          final rootNodes = assetsStore.assetTree;

          return ListView.builder(
            itemCount: rootNodes.length,
            itemBuilder: (context, index) {
              return TreeNodeWidget(
                node: rootNodes[index],
              );
            },
          );
        },
      ),
    );
  }
}
