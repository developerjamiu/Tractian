import 'package:mobx/mobx.dart';
import 'package:tractian/src/core/exceptions/app_exception.dart';
import 'package:tractian/src/data/models/asset.dart';
import 'package:tractian/src/data/models/component.dart';
import 'package:tractian/src/data/models/location.dart';
import 'package:tractian/src/data/models/tree_node.dart';
import 'package:tractian/src/data/repositories/companies_repository.dart';

part 'assets_store.g.dart';

enum AssetsStoreState { initial, loading, loaded, error }

class AssetsStore = _AssetsStore with _$AssetsStore;

abstract class _AssetsStore with Store {
  final CompaniesRepository _companiesRepository;
  final String _companyId;

  _AssetsStore({
    required CompaniesRepository companiesRepository,
    required String companyId,
  })  : _companiesRepository = companiesRepository,
        _companyId = companyId;

  @readonly
  AssetsStoreState _state = AssetsStoreState.initial;

  @readonly
  List<Location> _locations = [];

  @readonly
  List<Asset> _assets = [];

  @readonly
  List<Component> _components = [];

  @readonly
  String? _errorMessage;

  @computed
  List<TreeNode> get assetTree {
    final locationNodes = <String, TreeNode>{};

    for (final location in _locations) {
      locationNodes[location.id] = TreeNode(
        id: location.id,
        name: location.name,
        type: NodeType.location,
      );
    }

    for (var location in _locations) {
      if (location.parentId != null) {
        locationNodes[location.parentId]?.addChild(locationNodes[location.id]);
      }
    }

    final List<TreeNode> otherRootNodes = [];

    final Map<String, TreeNode> assetNodes = {};

    for (final asset in _assets) {
      final node = TreeNode(
        id: asset.id,
        name: asset.name,
        type: NodeType.asset,
      );

      assetNodes[asset.id] = node;

      if (asset.locationId != null) {
        locationNodes[asset.locationId]?.addChild(node);
      } else if (asset.parentId != null) {
        assetNodes[asset.parentId]?.addChild(node);
      } else {
        otherRootNodes.add(node);
      }
    }

    for (final component in _components) {
      final node = TreeNode(
        id: component.id,
        name: component.name,
        type: NodeType.component,
      );

      if (component.parentId != null) {
        if (assetNodes.containsKey(component.parentId)) {
          assetNodes[component.parentId]?.addChild(node);
        } else if (locationNodes.containsKey(component.parentId)) {
          locationNodes[component.parentId]?.addChild(node);
        }
      } else {
        otherRootNodes.add(node);
      }
    }

    return [
      ...locationNodes.values.where(
        (node) => _locations.any(
          (location) => location.parentId == null && location.id == node.id,
        ),
      ),
      ...otherRootNodes,
    ];
  }

  @action
  Future<void> initializeAssets() async {
    try {
      _state = AssetsStoreState.loading;

      await Future.wait(
        [
          fetchCompanyLocation(),
          fetchCompanyAssets(),
        ],
      );

      _state = AssetsStoreState.loaded;
    } on AppException catch (error) {
      _state = AssetsStoreState.error;
      _errorMessage = error.message;
    }
  }

  Future<void> fetchCompanyLocation() async {
    _locations = await _companiesRepository.getCompanyLocations(
      companyId: _companyId,
    );
  }

  Future<void> fetchCompanyAssets() async {
    final assetsAndComponents =
        await _companiesRepository.getCompanyAssetsAndComponents(
      companyId: _companyId,
    );

    _assets = assetsAndComponents.$1;
    _components = assetsAndComponents.$2;
  }
}
