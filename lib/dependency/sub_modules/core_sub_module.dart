import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app_template/core/analytics/ux_cam_impl.dart';
import 'package:flutter_app_template/core/data/dao.dart';
import 'package:flutter_app_template/core/data/database.dart';
import 'package:flutter_app_template/core/interceptors/default_interceptor.dart';
import 'package:flutter_app_template/core/services/http_service.dart';
import 'package:flutter_app_template/core/services/http_service_impl.dart';
import 'package:flutter_app_template/core/third_party_service_wrapper/ads/abstract_ads.dart';
import 'package:flutter_app_template/core/third_party_service_wrapper/ads/ads.dart';
import 'package:flutter_app_template/core/third_party_service_wrapper/auth/authentication.dart';
import 'package:flutter_app_template/core/third_party_service_wrapper/package_info/package_info.dart';
import 'package:template_package/template_package.dart';

class CoreSubModule extends ISubModule {
  BaseAnalytics? _analytics;
  late AbstractAds _ads;
  HTTPService? _httpService;
  RemoteConfiguration remoteConfiguration;
  late Dao _dao;

  CoreSubModule(this.remoteConfiguration) {
    _ads = Ads(remoteConfiguration);
    _dao = DataBase(FirebaseFirestore.instance);
  }

  @override
  init(List<ISubModule> subModules) {}

  BaseAnalytics analytics() {
    _analytics ??= AnalyticsProxy([UxCamImpl(remoteConfiguration)], enable: true);
    return _analytics!;
  }

  Dao dao() => _dao;

  AbstractAds ads() => _ads;

  Authentication get authentication => AuthenticationImpl(FirebaseAuth.instance);

  RemoteConfiguration remoteConfig() => remoteConfiguration;

  PackageInfoWrapper packageInfoWrapper() => PackageInfoWrapper();

  HTTPService httpService() {
    _httpService ??= HTTPServiceImpl(Dio()..interceptors.add(interceptorDefault()));
    return _httpService!;
  }

  ApiInterceptor interceptorDefault() {
    return ApiInterceptor(remoteConfiguration: remoteConfig());
  }
}
