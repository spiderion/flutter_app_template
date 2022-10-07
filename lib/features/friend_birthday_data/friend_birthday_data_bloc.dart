import 'dart:async';

import 'package:flutter_app_template/core/analytics/ux_cam_impl.dart';
import 'package:flutter_app_template/core/events/common_events.dart';
import 'package:flutter_app_template/features/friend_birthday_data/friend_birthday_data_state.dart';
import 'package:flutter_app_template/navigation/navigate_to_friend_birthday_data_page.dart';
import 'package:template_package/template_package.dart';

class FriendBirthdayDateBloc extends TemplateBloc {
  final StreamController myDataStateController = StreamController<FriendBirthdayDataState>();

  FriendBirthdayDateBloc(BaseAnalytics analytics) : super(analytics, analyticFrameworkTypes: [UxCamImpl]) {
    registerStreams([myDataStateController.stream]);
    init();
  }

  void init() {
    myDataStateController.sink.add(FriendBirthdayDataState(isDataEmpty: true));
  }

  @override
  void onUiDataChange(BaseBlocEvent event) {
    if (event is ContinueButtonClickEvent) {
      continueTapEvent();
    }
  }

  void continueTapEvent() {
    sinkState?.add(NavigateToFriendBirthdayDatePage());
  }

  @override
  void dispose() {
    myDataStateController.close();
    super.dispose();
  }
}
