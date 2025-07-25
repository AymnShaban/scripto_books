import 'package:dio/dio.dart';

class ApiService {
  final _baseUrl = 'https://www.dbooks.org/api/';
  final Dio _dio;

  ApiService(this._dio);

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var response = await _dio.get('$_baseUrl$endPoint');
    return response.data;
  }
}
