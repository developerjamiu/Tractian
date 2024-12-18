import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:dio/dio.dart';
import 'package:tractian/src/core/exceptions/app_exception.dart';
import 'package:tractian/src/data/models/asset.dart';
import 'package:tractian/src/data/models/company.dart';
import 'package:tractian/src/data/models/component.dart';
import 'package:tractian/src/data/models/location.dart';
import 'package:tractian/src/data/repositories/traction_repository.dart';

import '../../../fixtures/assets.dart';
import '../../../fixtures/companies.dart';
import '../../../fixtures/locations.dart';

class MockDio extends Mock implements Dio {}

void main() {
  late TractionRepository repository;
  late MockDio mockDio;

  setUp(() {
    mockDio = MockDio();
    repository = TractionRepository(client: mockDio);
  });

  group('TractionRepository', () {
    group('getCompanies', () {
      test('should return a list of companies on success', () async {
        when(() => mockDio.get('/companies')).thenAnswer(
          (_) async => Response(
            data: companiesFixture,
            statusCode: 200,
            requestOptions: RequestOptions(path: '/companies'),
          ),
        );

        final companies = await repository.getCompanies();

        expect(companies, isA<List<Company>>());
        expect(companies.length, equals(3));
        expect(companies.first.name, equals('Jaguar'));
      });

      test('should throw AppException on error', () async {
        when(() => mockDio.get('/companies')).thenThrow(
          DioException(
            requestOptions: RequestOptions(path: '/companies'),
          ),
        );

        expect(
          () => repository.getCompanies(),
          throwsA(isA<AppException>()),
        );
      });
    });

    group('getCompanyAssetsAndComponents', () {
      test('should return assets and components on success', () async {
        when(() => mockDio.get('/companies/123/assets')).thenAnswer(
          (_) async => Response(
            data: assetsFixture,
            statusCode: 200,
            requestOptions: RequestOptions(path: '/companies/123/assets'),
          ),
        );

        final (assets, components) =
            await repository.getCompanyAssetsAndComponents(companyId: '123');

        expect(assets, isA<List<Asset>>());
        expect(components, isA<List<Component>>());
        expect(assets.length, equals(4));
        expect(components.length, equals(5));
      });

      test('should throw AppException on error', () async {
        when(() => mockDio.get('/companies/123/assets')).thenThrow(
          DioException(
            requestOptions: RequestOptions(path: '/companies/123/assets'),
          ),
        );

        expect(
          () => repository.getCompanyAssetsAndComponents(companyId: '123'),
          throwsA(isA<AppException>()),
        );
      });
    });

    group('getCompanyLocations', () {
      test('should return a list of locations on success', () async {
        when(() => mockDio.get('/companies/123/locations')).thenAnswer(
          (_) async => Response(
            data: locationsFixture,
            statusCode: 200,
            requestOptions: RequestOptions(path: '/companies/123/locations'),
          ),
        );

        final locations =
            await repository.getCompanyLocations(companyId: '123');

        expect(locations, isA<List<Location>>());
        expect(locations.length, equals(4));
        expect(locations.first.name, equals('CHARCOAL STORAGE SECTOR'));
      });

      test('should throw AppException on error', () async {
        when(() => mockDio.get('/companies/123/locations')).thenThrow(
          DioException(
            requestOptions: RequestOptions(path: '/companies/123/locations'),
          ),
        );

        expect(
          () => repository.getCompanyLocations(companyId: '123'),
          throwsA(isA<AppException>()),
        );
      });
    });
  });
}
