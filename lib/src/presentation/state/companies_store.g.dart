// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'companies_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CompaniesStore on _CompaniesStore, Store {
  late final _$_stateAtom =
      Atom(name: '_CompaniesStore._state', context: context);

  CompaniesStoreState get state {
    _$_stateAtom.reportRead();
    return super._state;
  }

  @override
  CompaniesStoreState get _state => state;

  @override
  set _state(CompaniesStoreState value) {
    _$_stateAtom.reportWrite(value, super._state, () {
      super._state = value;
    });
  }

  late final _$_companiesAtom =
      Atom(name: '_CompaniesStore._companies', context: context);

  List<Company> get companies {
    _$_companiesAtom.reportRead();
    return super._companies;
  }

  @override
  List<Company> get _companies => companies;

  @override
  set _companies(List<Company> value) {
    _$_companiesAtom.reportWrite(value, super._companies, () {
      super._companies = value;
    });
  }

  late final _$_errorMessageAtom =
      Atom(name: '_CompaniesStore._errorMessage', context: context);

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

  late final _$fetchCompaniesAsyncAction =
      AsyncAction('_CompaniesStore.fetchCompanies', context: context);

  @override
  Future<void> fetchCompanies() {
    return _$fetchCompaniesAsyncAction.run(() => super.fetchCompanies());
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
