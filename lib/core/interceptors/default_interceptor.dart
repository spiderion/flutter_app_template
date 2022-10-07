import 'package:dio/dio.dart';
import 'package:flutter_app_template/core/constants/key_constants.dart';
import 'package:template_package/template_package.dart';

class ApiInterceptor extends InterceptorsWrapper {
  final RemoteConfiguration remoteConfiguration;

  ApiInterceptor({required this.remoteConfiguration});

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    String? idToken = remoteConfiguration.getString(ConfigKeyConstants.OPEN_AI_KEY);
    if (idToken.isNotEmpty && idToken.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $idToken';
    }
    super.onRequest(options, handler);
  }
}
