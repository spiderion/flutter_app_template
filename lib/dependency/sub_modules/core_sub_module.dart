import 'package:template_package/template_package.dart';

class CoreSubModule extends ISubModule {
  BaseAnalytics? _analytics;

  @override
  init(List<ISubModule> subModules) {}

  BaseAnalytics analytics() {
    _analytics ??= AnalyticsProxy([]);
    return _analytics!;
  }
}
