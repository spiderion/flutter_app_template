import 'dart:async';

import 'package:flutter_app_template/core/analytics/ux_cam_impl.dart';
import 'package:flutter_app_template/core/data/personalities.dart';
import 'package:flutter_app_template/core/models/ui_models/item_text.dart';
import 'package:flutter_app_template/core/third_party_service_wrapper/package_info/package_info.dart';
import 'package:flutter_app_template/features/intro/intro_event.dart';
import 'package:flutter_app_template/features/intro/intro_state.dart';
import 'package:flutter_app_template/navigation/navigate_to_friend_name_page.dart';
import 'package:template_package/template_package.dart';

class IntroBloc extends TemplateBloc {
  List<ItemText> personalities = Personalities().getPersonalities();
  List<ItemText> selectedPersonalities = [];
  late String appVersion;
  final PackageInfoWrapper packageInfoWrapper;

  final StreamController introDataStateController = StreamController<IntroDataState>();

  IntroBloc(BaseAnalytics analytics, this.packageInfoWrapper)
      : super(analytics, analyticFrameworkTypes: [UxCamImpl]) {
    registerStreams([introDataStateController.stream]);
    init();
  }

  void init() async {
    appVersion = await packageInfoWrapper.getAppVersionWithBuildNumber();
    introDataStateController.sink.add(IntroDataState(appVersion: appVersion));
  }

  @override
  void onUiDataChange(BaseBlocEvent event) {
    if (event is CreateTapEvent) {
      createTap();
    }
  }

  void createTap() {
    personalities
      ..clear()
      ..addAll(Personalities().getPersonalities());
    sinkState?.add(NavigateToFriendNamePage(onPop: (result) {}));
  }

  @override
  void dispose() {
    introDataStateController.close();
    super.dispose();
  }
}
