import 'package:mobx/mobx.dart';

import '../models/Tenant.dart';

part 'tenants.store.g.dart';

class TenantsStore = _TenantsStoreBase with _$TenantsStore;

abstract class _TenantsStoreBase with Store {
  @observable
  Tenant tenant = null;

  @action
  void setTenant(Tenant value) => tenant = value;
}
