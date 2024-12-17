import 'package:dio/dio.dart';
import 'package:tractian/src/core/exceptions/app_exception.dart';
import 'package:tractian/src/data/models/company.dart';

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
}
