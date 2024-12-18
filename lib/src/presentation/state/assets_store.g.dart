// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'assets_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AssetsStore on _AssetsStore, Store {
  Computed<List<TreeNode>>? _$filteredAssetTreeComputed;

  @override
  List<TreeNode> get filteredAssetTree => (_$filteredAssetTreeComputed ??=
          Computed<List<TreeNode>>(() => super.filteredAssetTree,
              name: '_AssetsStore.filteredAssetTree'))
      .value;
  Computed<List<TreeNode>>? _$assetTreeComputed;

  @override
  List<TreeNode> get assetTree =>
      (_$assetTreeComputed ??= Computed<List<TreeNode>>(() => super.assetTree,
              name: '_AssetsStore.assetTree'))
          .value;

  late final _$_stateAtom = Atom(name: '_AssetsStore._state', context: context);

  AssetsStoreState get state {
    _$_stateAtom.reportRead();
    return super._state;
  }

  @override
  AssetsStoreState get _state => state;

  @override
  set _state(AssetsStoreState value) {
    _$_stateAtom.reportWrite(value, super._state, () {
      super._state = value;
    });
  }

  late final _$_searchQueryAtom =
      Atom(name: '_AssetsStore._searchQuery', context: context);

  String get searchQuery {
    _$_searchQueryAtom.reportRead();
    return super._searchQuery;
  }

  @override
  String get _searchQuery => searchQuery;

  @override
  set _searchQuery(String value) {
    _$_searchQueryAtom.reportWrite(value, super._searchQuery, () {
      super._searchQuery = value;
    });
  }

  late final _$_locationsAtom =
      Atom(name: '_AssetsStore._locations', context: context);

  Iterable<Location> get locations {
    _$_locationsAtom.reportRead();
    return super._locations;
  }

  @override
  Iterable<Location> get _locations => locations;

  @override
  set _locations(Iterable<Location> value) {
    _$_locationsAtom.reportWrite(value, super._locations, () {
      super._locations = value;
    });
  }

  late final _$_assetsAtom =
      Atom(name: '_AssetsStore._assets', context: context);

  Iterable<Asset> get assets {
    _$_assetsAtom.reportRead();
    return super._assets;
  }

  @override
  Iterable<Asset> get _assets => assets;

  @override
  set _assets(Iterable<Asset> value) {
    _$_assetsAtom.reportWrite(value, super._assets, () {
      super._assets = value;
    });
  }

  late final _$_componentsAtom =
      Atom(name: '_AssetsStore._components', context: context);

  Iterable<Component> get components {
    _$_componentsAtom.reportRead();
    return super._components;
  }

  @override
  Iterable<Component> get _components => components;

  @override
  set _components(Iterable<Component> value) {
    _$_componentsAtom.reportWrite(value, super._components, () {
      super._components = value;
    });
  }

  late final _$_errorMessageAtom =
      Atom(name: '_AssetsStore._errorMessage', context: context);

  String? get errorMessage {
    _$_errorMessageAtom.reportRead();
    return super._errorMessage;
  }

  @override
  String? get _errorMessage => errorMessage;

  @override
  set _errorMessage(String? value) {
    _$_errorMessageAtom.reportWrite(value, super._errorMessage, () {
      super._errorMessage = value;
    });
  }

  late final _$_isEnergySensorAtom =
      Atom(name: '_AssetsStore._isEnergySensor', context: context);

  bool get isEnergySensor {
    _$_isEnergySensorAtom.reportRead();
    return super._isEnergySensor;
  }

  @override
  bool get _isEnergySensor => isEnergySensor;

  @override
  set _isEnergySensor(bool value) {
    _$_isEnergySensorAtom.reportWrite(value, super._isEnergySensor, () {
      super._isEnergySensor = value;
    });
  }

  late final _$_isCriticalAtom =
      Atom(name: '_AssetsStore._isCritical', context: context);

  bool get isCritical {
    _$_isCriticalAtom.reportRead();
    return super._isCritical;
  }

  @override
  bool get _isCritical => isCritical;

  @override
  set _isCritical(bool value) {
    _$_isCriticalAtom.reportWrite(value, super._isCritical, () {
      super._isCritical = value;
    });
  }

  late final _$initializeAssetsAsyncAction =
      AsyncAction('_AssetsStore.initializeAssets', context: context);

  @override
  Future<void> initializeAssets() {
    return _$initializeAssetsAsyncAction.run(() => super.initializeAssets());
  }

  late final _$_AssetsStoreActionController =
      ActionController(name: '_AssetsStore', context: context);

  @override
  void searchAssets(String query) {
    final _$actionInfo = _$_AssetsStoreActionController.startAction(
        name: '_AssetsStore.searchAssets');
    try {
      return super.searchAssets(query);
    } finally {
      _$_AssetsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleEnergySensor() {
    final _$actionInfo = _$_AssetsStoreActionController.startAction(
        name: '_AssetsStore.toggleEnergySensor');
    try {
      return super.toggleEnergySensor();
    } finally {
      _$_AssetsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleCritical() {
    final _$actionInfo = _$_AssetsStoreActionController.startAction(
        name: '_AssetsStore.toggleCritical');
    try {
      return super.toggleCritical();
    } finally {
      _$_AssetsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
filteredAssetTree: ${filteredAssetTree},
assetTree: ${assetTree}
    ''';
  }
}
