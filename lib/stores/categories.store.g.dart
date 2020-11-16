// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categories.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CategoriesStore on _CategoriesStoreBase, Store {
  final _$categoriesAtom = Atom(name: '_CategoriesStoreBase.categories');

  @override
  ObservableList<Category> get categories {
    _$categoriesAtom.reportRead();
    return super.categories;
  }

  @override
  set categories(ObservableList<Category> value) {
    _$categoriesAtom.reportWrite(value, super.categories, () {
      super.categories = value;
    });
  }

  final _$filtersCategoryAtom =
      Atom(name: '_CategoriesStoreBase.filtersCategory');

  @override
  List<String> get filtersCategory {
    _$filtersCategoryAtom.reportRead();
    return super.filtersCategory;
  }

  @override
  set filtersCategory(List<String> value) {
    _$filtersCategoryAtom.reportWrite(value, super.filtersCategory, () {
      super.filtersCategory = value;
    });
  }

  final _$filterChangedAtom = Atom(name: '_CategoriesStoreBase.filterChanged');

  @override
  bool get filterChanged {
    _$filterChangedAtom.reportRead();
    return super.filterChanged;
  }

  @override
  set filterChanged(bool value) {
    _$filterChangedAtom.reportWrite(value, super.filterChanged, () {
      super.filterChanged = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_CategoriesStoreBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$getCategoriesAsyncAction =
      AsyncAction('_CategoriesStoreBase.getCategories');

  @override
  Future<dynamic> getCategories(String tokenCompany) {
    return _$getCategoriesAsyncAction
        .run(() => super.getCategories(tokenCompany));
  }

  final _$_CategoriesStoreBaseActionController =
      ActionController(name: '_CategoriesStoreBase');

  @override
  void setLoading(bool value) {
    final _$actionInfo = _$_CategoriesStoreBaseActionController.startAction(
        name: '_CategoriesStoreBase.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$_CategoriesStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addCategory(Category category) {
    final _$actionInfo = _$_CategoriesStoreBaseActionController.startAction(
        name: '_CategoriesStoreBase.addCategory');
    try {
      return super.addCategory(category);
    } finally {
      _$_CategoriesStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeCategory(Category category) {
    final _$actionInfo = _$_CategoriesStoreBaseActionController.startAction(
        name: '_CategoriesStoreBase.removeCategory');
    try {
      return super.removeCategory(category);
    } finally {
      _$_CategoriesStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearCategory() {
    final _$actionInfo = _$_CategoriesStoreBaseActionController.startAction(
        name: '_CategoriesStoreBase.clearCategory');
    try {
      return super.clearCategory();
    } finally {
      _$_CategoriesStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addFilter(String identify) {
    final _$actionInfo = _$_CategoriesStoreBaseActionController.startAction(
        name: '_CategoriesStoreBase.addFilter');
    try {
      return super.addFilter(identify);
    } finally {
      _$_CategoriesStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeFilter(String identify) {
    final _$actionInfo = _$_CategoriesStoreBaseActionController.startAction(
        name: '_CategoriesStoreBase.removeFilter');
    try {
      return super.removeFilter(identify);
    } finally {
      _$_CategoriesStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool inFilter(String identify) {
    final _$actionInfo = _$_CategoriesStoreBaseActionController.startAction(
        name: '_CategoriesStoreBase.inFilter');
    try {
      return super.inFilter(identify);
    } finally {
      _$_CategoriesStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearFilter() {
    final _$actionInfo = _$_CategoriesStoreBaseActionController.startAction(
        name: '_CategoriesStoreBase.clearFilter');
    try {
      return super.clearFilter();
    } finally {
      _$_CategoriesStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
categories: ${categories},
filtersCategory: ${filtersCategory},
filterChanged: ${filterChanged},
isLoading: ${isLoading}
    ''';
  }
}
