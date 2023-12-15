import 'package:bharath_work_assessment/data/datasource/api/api_constants.dart';
import 'package:dio/dio.dart';

class APIService {
  static const String _baseUrl = "https://cross-platform.rp.devfactory.com/";
  late Dio _dio;

  APIService() {
    _dio = Dio(BaseOptions(
      baseUrl: _baseUrl,
    ));
  }

  Future<Map<String, dynamic>?> executeRequest(APIEnpoint endPoint, Map<String, dynamic> queryParams) async {
    if (endPoint.requestType == APIRequestType.get) {
      return (await _dio.get<Map<String, dynamic>>(endPoint.path, queryParameters: queryParams)).data;
    } else if (endPoint.requestType == APIRequestType.post) {
      return (await _dio.post<Map<String, dynamic>>(endPoint.path, queryParameters: queryParams)).data;
    } else {
      throw UnimplementedError("No other endpoint types were implemented");
    }
  }

  Future<Map<String, dynamic>?> executePostRequest(APIEnpoint endPoint, Map<String, dynamic> queryParams) async {
    final response = await _dio.get<Map<String, dynamic>>(endPoint.path, queryParameters: queryParams);
    return response.data;
  }
}
