import 'package:mobx/mobx.dart';
import 'package:tractian/src/core/exceptions/app_exception.dart';
import 'package:tractian/src/data/models/asset.dart';
import 'package:tractian/src/data/models/component.dart';
import 'package:tractian/src/data/models/location.dart';
import 'package:tractian/src/data/models/tree_node.dart';
import 'package:tractian/src/data/repositories/traction_repository.dart';

part 'assets_store.g.dart';

enum AssetsStoreState { initial, loading, loaded, error }

class AssetsStore = _AssetsStore with _$AssetsStore;

abstract class _AssetsStore with Store {
  final TractionRepository _tractionRepository;
  final String _companyId;

  _AssetsStore({
    required TractionRepository tractionRepository,
    required String companyId,
  })  : _tractionRepository = tractionRepository,
        _companyId = companyId;

  @readonly
  AssetsStoreState _state = AssetsStoreState.initial;

  @readonly
  String _searchQuery = '';

  @readonly
  Iterable<Location> _locations = [];

  @readonly
  Iterable<Asset> _assets = [];

  @readonly
  Iterable<Component> _components = [];

  @readonly
  String? _errorMessage;

  @readonly
  bool _isEnergySensor = false;

  @readonly
  bool _isCritical = false;

  @computed
  List<TreeNode> get filteredAssetTree => search(assetTree, _searchQuery);

  List<TreeNode> search(List<TreeNode> nodes, String query) {
    final Set<TreeNode> results = {};

    for (final node in nodes) {
      final res = search(node.children, query);

      final isEnergySensor =
          !_isEnergySensor || node.sensorType == SensorType.energy;

      final isCritical = !_isCritical || node.status == Status.alert;

      if (res.isNotEmpty) {
        results.add(
          TreeNode(
            id: node.id,
            name: node.name,
            type: node.type,
            children: res.isNotEmpty ? res : node.children,
            isExpanded: node.isExpanded,
            sensorType: node.sensorType,
            status: node.status,
          ),
        );
      } else if (node.name.toLowerCase().contains(query.toLowerCase()) &&
          isEnergySensor &&
          isCritical) {
        results.add(
          TreeNode(
            id: node.id,
            name: node.name,
            type: node.type,
            children: [],
            isExpanded: node.isExpanded,
            sensorType: node.sensorType,
            status: node.status,
          ),
        );
      }
    }

    return results.toList();
  }

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
        sensorType: component.sensorType,
        status: component.status,
      );

      if (component.parentId != null) {
        if (assetNodes.containsKey(component.parentId)) {
          assetNodes[component.parentId]?.addChild(node);
        } else if (locationNodes.containsKey(component.parentId)) {
          locationNodes[component.parentId]?.addChild(node);
        } else if (locationNodes.containsKey(component.locationId)) {
          locationNodes[component.locationId]?.addChild(node);
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

  @action
  void searchAssets(String query) => _searchQuery = query;

  @action
  void toggleEnergySensor() => _isEnergySensor = !_isEnergySensor;

  @action
  void toggleCritical() => _isCritical = !_isCritical;

  Future<void> fetchCompanyLocation() async {
    _locations = await _tractionRepository.getCompanyLocations(
      companyId: _companyId,
    );
  }

  Future<void> fetchCompanyAssets() async {
    final assetsAndComponents =
        await _tractionRepository.getCompanyAssetsAndComponents(
      companyId: _companyId,
    );

    _assets = assetsAndComponents.$1;
    _components = assetsAndComponents.$2;
  }
}
