import '../../../data/network/dio_client.dart';
import '../../../constants/api.dart';

class CategoryRepository {
  var _httpClient;

  CategoryRepository() {
    _httpClient = new DioClient();
  }

  Future<List<dynamic>> getCategories(String tokenCompany) async {
    final response = await _httpClient.get('$API_VERSION/categories',
        queryParameters: {'token_company': tokenCompany});

    return (response.data['data'] as List).toList();
  }
}
