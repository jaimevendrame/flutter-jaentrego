import '../../../data/network/dio_client.dart';
import '../../../constants/api.dart';

class ProductRepository {
  var _httpClient;

  ProductRepository() {
    _httpClient = new DioClient();
  }

  Future<List<dynamic>> getProducts(String tokenCompany,
      {List<String> filterCategories}) async {
    final response =
        await _httpClient.get('$API_VERSION/products', queryParameters: {
      'token_company': tokenCompany,
      'categories': (filterCategories != null && filterCategories.length > 0)
          ? filterCategories
          : []
    });

    print(tokenCompany);

    return (response.data['data'] as List).toList();
  }
}
