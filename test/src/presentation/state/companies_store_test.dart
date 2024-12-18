import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tractian/src/core/exceptions/app_exception.dart';
import 'package:tractian/src/data/models/company.dart';
import 'package:tractian/src/data/repositories/traction_repository.dart';
import 'package:tractian/src/presentation/state/companies_store.dart';

class MockTractionRepository extends Mock implements TractionRepository {}

void main() {
  late MockTractionRepository mockRepository;
  late CompaniesStore store;

  setUp(() {
    mockRepository = MockTractionRepository();
    store = CompaniesStore(
      tractionRepository: mockRepository,
    );
  });

  group(
    'CompaniesStore',
    () {
      test(
        'initializes with the correct default state',
        () {
          expect(store.state, equals(CompaniesStoreState.initial));
          expect(store.companies, isEmpty);
          expect(store.errorMessage, isNull);
        },
      );

      test(
        'fetchCompanies sets state to loaded and updates companies on success',
        () async {
          final mockCompanies = [
            Company(id: '1', name: 'Company 1'),
            Company(id: '2', name: 'Company 2'),
          ];

          when(() => mockRepository.getCompanies()).thenAnswer(
            (_) async => mockCompanies,
          );

          final future = store.fetchCompanies();

          expect(store.state, equals(CompaniesStoreState.loading));

          await future;

          expect(store.state, equals(CompaniesStoreState.loaded));
          expect(store.companies, equals(mockCompanies));
          expect(store.errorMessage, isNull);
        },
      );

      test(
        'fetchCompanies sets state to error and updates errorMessage on failure',
        () async {
          const mockErrorMessage = 'Failed to fetch companies';
          final mockError = AppException(
            mockErrorMessage,
            error: Exception(mockErrorMessage),
            stackTrace: StackTrace.current,
          );

          when(() => mockRepository.getCompanies()).thenThrow(mockError);

          await store.fetchCompanies();

          expect(store.state, CompaniesStoreState.error);
          expect(store.companies, isEmpty);
          expect(store.errorMessage, mockErrorMessage);
        },
      );
    },
  );
}
