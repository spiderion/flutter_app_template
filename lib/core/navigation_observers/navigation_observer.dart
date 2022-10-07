import 'package:flutter/material.dart';
import 'package:flutter_app_template/core/analytics/ux_cam_impl.dart';
import 'package:template_package/template_package.dart';

class DefaultNavigationObserver extends RouteObserver<ModalRoute<dynamic>> {
  final BaseAnalytics analytics;

  DefaultNavigationObserver({required this.analytics});

  void _sendScreenView(Route? newRoute, Route? oldRoute) {
    final pageName = newRoute?.settings.name ?? 'no_name';
    analytics.logPageName(pageName, [UxCamImpl]);
  }

  @override
  void didPush(Route route, Route? previousRoute) {
    _sendScreenView(route, previousRoute);
    super.didPush(route, previousRoute);
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    _sendScreenView(newRoute, oldRoute);
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    super.didPop(route, previousRoute);
    // On pop, the "previous" route is now the new route.
    _sendScreenView(previousRoute, route);
  }
}
