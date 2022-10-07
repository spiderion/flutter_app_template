import 'package:flutter_app_template/core/data/dao.dart';
import 'package:flutter_app_template/core/ebr/ai_prompt_ebr.dart';
import 'package:flutter_app_template/core/services/http_service.dart';
import 'package:flutter_app_template/core/third_party_service_wrapper/ads/abstract_ads.dart';
import 'package:flutter_app_template/core/use_cases/ai_request_use_case.dart';
import 'package:mockito/annotations.dart';
import 'package:template_package/template_package.dart';

/// Add new class that you want to mock here
/// Then run (dart run build_runner build)
/// It will create YourClassMock
@GenerateMocks([
  RemoteConfiguration,
  Dao,
  HTTPService,
  BaseAnalytics,
  AiRequestUseCase,
  AiPromptEBR,
  AbstractAds,
])
main() {}
