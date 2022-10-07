import 'package:flutter/material.dart';
import 'package:flutter_app_template/widgets/loaders/app_default_loader.dart';
import 'package:template_package/template_package.dart';

class StartProgressState extends BaseBlocPrimaryState {
  final bool? barrierDismissible;

  StartProgressState({this.barrierDismissible});

  @override
  call(param) {
    if (param is BuildContext) {
      showDialog(
          context: param,
          barrierDismissible: barrierDismissible ?? false,
          builder: (context) {
            return Center(child: LoaderDefault());
          });
    }
  }
}

class AppVersionDataState extends BaseBlocDataState {
  final String? version;
  final String? buildNumber;
  final String flavor;

  AppVersionDataState({this.version, this.buildNumber, required this.flavor});
}

class NotificationLabelDataState extends BaseBlocDataState {
  final int newNotificationCount;

  NotificationLabelDataState(this.newNotificationCount);
}

class SettingsClickEvent extends BaseBlocEvent {
  SettingsClickEvent(String analyticEventName) : super(analyticEventName);
}
