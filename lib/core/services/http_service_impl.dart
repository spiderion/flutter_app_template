import 'package:dio/dio.dart';
import 'package:flutter_app_template/core/services/http_service.dart';

class HTTPServiceImpl extends HTTPService {
  final Dio _dio;
  final String baseURL = 'https://api.openai.com/';

  HTTPServiceImpl(this._dio);

  @override
  Future<dynamic> completion(Map<String, dynamic> model) async {
    return (await _dio.post('${baseURL}v1/completions', data: model)).data;
  }
}
