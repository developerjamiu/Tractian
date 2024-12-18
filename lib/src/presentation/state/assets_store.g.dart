// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'assets_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AssetsStore on _AssetsStore, Store {
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

  late final _$_locationsAtom =
      Atom(name: '_AssetsStore._locations', context: context);

  List<Location> get locations {
    _$_locationsAtom.reportRead();
    return super._locations;
  }

  @override
  List<Location> get _locations => locations;

  @override
  set _locations(List<Location> value) {
    _$_locationsAtom.reportWrite(value, super._locations, () {
      super._locations = value;
    });
  }

  late final _$_assetsAtom =
      Atom(name: '_AssetsStore._assets', context: context);

  List<Asset> get assets {
    _$_assetsAtom.reportRead();
    return super._assets;
  }

  @override
  List<Asset> get _assets => assets;

  @override
  set _assets(List<Asset> value) {
    _$_assetsAtom.reportWrite(value, super._assets, () {
      super._assets = value;
    });
  }

  late final _$_componentsAtom =
      Atom(name: '_AssetsStore._components', context: context);

  List<Component> get components {
    _$_componentsAtom.reportRead();
    return super._components;
  }

  @override
  List<Component> get _components => components;

  @override
  set _components(List<Component> value) {
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

  late final _$initializeAssetsAsyncAction =
      AsyncAction('_AssetsStore.initializeAssets', context: context);

  @override
  Future<void> initializeAssets() {
    return _$initializeAssetsAsyncAction.run(() => super.initializeAssets());
  }

  @override
  String toString() {
    return '''
assetTree: ${assetTree}
    ''';
  }
}
