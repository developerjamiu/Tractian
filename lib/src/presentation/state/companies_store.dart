import 'package:mobx/mobx.dart';
import 'package:tractian/src/core/exceptions/app_exception.dart';
import 'package:tractian/src/data/models/company.dart';
import 'package:tractian/src/data/repositories/traction_repository.dart';

part 'companies_store.g.dart';

enum CompaniesStoreState { initial, loading, loaded, error }

class CompaniesStore = _CompaniesStore with _$CompaniesStore;

abstract class _CompaniesStore with Store {
  final TractionRepository _tractionRepository;

  _CompaniesStore({
    required TractionRepository tractionRepository,
  }) : _tractionRepository = tractionRepository;

  @readonly
  CompaniesStoreState _state = CompaniesStoreState.initial;

  @readonly
  List<Company> _companies = [];

  @readonly
  String? _errorMessage;

  @action
  Future<void> fetchCompanies() async {
    try {
      _state = CompaniesStoreState.loading;

      _companies = await _tractionRepository.getCompanies();

      _state = CompaniesStoreState.loaded;
    } on AppException catch (error) {
      _state = CompaniesStoreState.error;
      _errorMessage = error.message;
    }
  }
}
