// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tenants.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TenantsStore on _TenantsStoreBase, Store {
  final _$tenantAtom = Atom(name: '_TenantsStoreBase.tenant');

  @override
  Tenant get tenant {
    _$tenantAtom.reportRead();
    return super.tenant;
  }

  @override
  set tenant(Tenant value) {
    _$tenantAtom.reportWrite(value, super.tenant, () {
      super.tenant = value;
    });
  }

  final _$_TenantsStoreBaseActionController =
      ActionController(name: '_TenantsStoreBase');

  @override
  void setTenant(Tenant value) {
    final _$actionInfo = _$_TenantsStoreBaseActionController.startAction(
        name: '_TenantsStoreBase.setTenant');
    try {
      return super.setTenant(value);
    } finally {
      _$_TenantsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
tenant: ${tenant}
    ''';
  }
}
