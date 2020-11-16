import '../../../data/network/dio_client.dart';
import '../../../models/Tenant.dart';
import '../../../constants/api.dart';

class TenantRepository {
  var _httpClient;

  TenantRepository() {
    _httpClient = new DioClient();
  }

  Future<List<Tenant>> getTenants() async {
    final response = await _httpClient.get('$API_VERSION/tenants');

    final List _tenants = (response.data['data'] as List).map((tenant) {
      // _tenants.add(Tenant.fromJson(tenant));
      return Tenant.fromJson(tenant);
    }).toList();

    return _tenants;
  }
}
