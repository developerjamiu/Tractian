import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tractian/src/core/exceptions/app_exception.dart';
import 'package:tractian/src/data/models/asset.dart';
import 'package:tractian/src/data/models/component.dart';
import 'package:tractian/src/data/models/location.dart';
import 'package:tractian/src/data/repositories/traction_repository.dart';
import 'package:tractian/src/presentation/state/assets_store.dart';

class MockTractionRepository extends Mock implements TractionRepository {}

void main() {
  late MockTractionRepository mockRepository;
  late AssetsStore store;

  const companyId = 'company123';
  const location1 = Location(id: 'loc1', name: 'Location 1');
  const location2 = Location(id: 'loc2', name: 'Location 2', parentId: 'loc1');
  const asset1 = Asset(id: 'asset1', name: 'Asset 1', locationId: 'loc1');
  const asset2 = Asset(id: 'asset2', name: 'Asset 2');
  const component1 = Component(
    id: 'comp1',
    name: 'Component 1',
    parentId: 'asset1',
    sensorType: SensorType.energy,
    status: Status.alert,
  );

  setUp(() {
    mockRepository = MockTractionRepository();
    store = AssetsStore(
      tractionRepository: mockRepository,
      companyId: companyId,
    );
  });

  group('AssetsStore', () {
    test('initializeAssets sets state to loaded on success', () async {
      when(
        () => mockRepository.getCompanyLocations(companyId: companyId),
      ).thenAnswer((_) async => [location1, location2]);

      when(
        () => mockRepository.getCompanyAssetsAndComponents(
          companyId: companyId,
        ),
      ).thenAnswer((_) async => ([asset1, asset2], [component1]));

      await store.initializeAssets();

      expect(store.state, AssetsStoreState.loaded);
      expect(store.locations, containsAll([location1, location2]));
      expect(store.assets, containsAll([asset1, asset2]));
      expect(store.components, contains(component1));
    });

    test('initializeAssets sets state to error on failure', () async {
      const errorMessage = 'Failed to fetch assets';
      when(
        () => mockRepository.getCompanyLocations(companyId: companyId),
      ).thenThrow(
        AppException(
          errorMessage,
          error: Exception(errorMessage),
          stackTrace: StackTrace.current,
        ),
      );

      await store.initializeAssets();

      expect(store.state, AssetsStoreState.error);
      expect(store.errorMessage, errorMessage);
    });

    test('searchAssets updates search query after debounce', () async {
      const query = 'Asset 1';

      store.searchAssets(query);

      await Future.delayed(const Duration(milliseconds: 350));

      expect(store.searchQuery, query);
    });

    test('toggleEnergySensor toggles isEnergySensor', () {
      final initial = store.isEnergySensor;

      store.toggleEnergySensor();

      expect(store.isEnergySensor, !initial);

      store.toggleEnergySensor();

      expect(store.isEnergySensor, initial);
    });

    test('toggleCritical toggles isCritical', () {
      final initial = store.isCritical;

      store.toggleCritical();

      expect(store.isCritical, !initial);

      store.toggleCritical();

      expect(store.isCritical, initial);
    });

    test('filteredAssetTree returns filtered nodes based on search query',
        () async {
      when(
        () => mockRepository.getCompanyLocations(companyId: companyId),
      ).thenAnswer((_) async => [location1]);
      when(
        () => mockRepository.getCompanyAssetsAndComponents(
          companyId: companyId,
        ),
      ).thenAnswer((_) async => ([asset1], [component1]));

      await store.initializeAssets();

      store.searchAssets('Component 1');
      await Future.delayed(const Duration(milliseconds: 350));

      final result = store.filteredAssetTree;

      expect(result.length, 1);
      expect(result.first.name, 'Location 1');
      expect(result.first.children.first.name, 'Asset 1');
    });

    test('assetTree constructs tree correctly', () async {
      when(
        () => mockRepository.getCompanyLocations(companyId: companyId),
      ).thenAnswer((_) async => [location1, location2]);
      when(
        () => mockRepository.getCompanyAssetsAndComponents(
          companyId: companyId,
        ),
      ).thenAnswer((_) async => ([asset1, asset2], [component1]));

      await store.initializeAssets();

      final tree = store.assetTree;

      expect(tree.length, 2);
      expect(tree.first.name, 'Location 1');
      expect(tree.first.children.length, 2);
      expect(tree.first.children.first.name, 'Location 2');
      expect(tree.first.children.last.name, 'Asset 1');
    });
  });
}
