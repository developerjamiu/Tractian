import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:tractian/src/core/theme/app_colors.dart';
import 'package:tractian/src/core/theme/app_typography.dart';
import 'package:tractian/src/data/repositories/traction_repository.dart';
import 'package:tractian/src/presentation/state/assets_store.dart';
import 'package:tractian/src/presentation/widgets/app_empty_view.dart';
import 'package:tractian/src/presentation/widgets/app_error_view.dart';
import 'package:tractian/src/presentation/widgets/app_loading_view.dart';
import 'package:tractian/src/presentation/widgets/asset_filter.dart';
import 'package:tractian/src/presentation/widgets/assets_tree_view.dart';

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
        tractionRepository: context.read<TractionRepository>(),
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
          onPressed: Navigator.of(context).pop,
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
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                CupertinoSearchTextField(
                  placeholder: 'Buscar Ativo ou Local',
                  onChanged: assetsStore.searchAssets,
                ),
                SizedBox(height: 8),
                Observer(
                  builder: (context) {
                    return Row(
                      children: [
                        AssetFilter(
                          assetName: 'energy.svg',
                          title: 'Sensor de Energia',
                          isSelected: assetsStore.isEnergySensor,
                          onTap: assetsStore.toggleEnergySensor,
                        ),
                        SizedBox(width: 8),
                        AssetFilter(
                          assetName: 'criticio.svg',
                          title: 'Crítico',
                          isSelected: assetsStore.isCritical,
                          onTap: assetsStore.toggleCritical,
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
          Divider(
            height: 0,
            color: AppColors.lightGray,
          ),
          Expanded(
            child: Observer(
              builder: (context) {
                final assetTree = assetsStore.filteredAssetTree;

                if (assetsStore.state == AssetsStoreState.loading) {
                  return AppLoadingView();
                } else if (assetsStore.state == AssetsStoreState.error) {
                  return AppErrorView(
                    errorMessage: assetsStore.errorMessage,
                    onRetry: assetsStore.initializeAssets,
                  );
                } else if (assetTree.isEmpty) {
                  return AppEmptyView(
                    title: 'assets',
                  );
                } else {
                  return AssetsTreeView(
                    rootNodes: assetTree,
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
