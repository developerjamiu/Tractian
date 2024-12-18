import 'package:dio/dio.dart';
import 'package:tractian/src/core/exceptions/app_exception.dart';
import 'package:tractian/src/data/models/asset.dart';
import 'package:tractian/src/data/models/company.dart';
import 'package:tractian/src/data/models/component.dart';
import 'package:tractian/src/data/models/location.dart';

class CompaniesRepository {
  const CompaniesRepository({required Dio client}) : _client = client;

  final Dio _client;

  Future<List<Company>> getCompanies() async {
    try {
      final response = await _client.get('/companies');

      return Company.fromArray(response.data);
    } catch (error, stackTrace) {
      throw AppException.fromError(
        fallbackMessage: 'There was an error fetching companies',
        error: error,
        stackTrace: stackTrace,
      );
    }
  }

  Future<(List<Asset>, List<Component>)> getCompanyAssetsAndComponents({
    required String companyId,
  }) async {
    try {
      final response = await _client.get('/companies/$companyId/assets');

      final assetsData = response.data as List;
      final assets = <Asset>[];
      final components = <Component>[];

      for (final assetData in assetsData) {
        if (assetData['sensorType'] != null) {
          components.add(Component.fromJson(assetData));
        } else {
          assets.add(Asset.fromJson(assetData));
        }
      }

      return (assets, components);
    } catch (error, stackTrace) {
      throw AppException.fromError(
        fallbackMessage: 'There was an error fetching company assets',
        error: error,
        stackTrace: stackTrace,
      );
    }
  }

  Future<List<Location>> getCompanyLocations({
    required String companyId,
  }) async {
    try {
      final response = await _client.get('/companies/$companyId/locations');

      return Location.fromArray(response.data);
    } catch (error, stackTrace) {
      throw AppException.fromError(
        fallbackMessage: 'There was an error fetching company locations',
        error: error,
        stackTrace: stackTrace,
      );
    }
  }
}
