import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_app_template/core/analytics/analytic_events.dart';
import 'package:flutter_app_template/core/analytics/ux_cam_impl.dart';
import 'package:flutter_app_template/core/events/common_events.dart';
import 'package:flutter_app_template/core/models/celebrated.dart';
import 'package:flutter_app_template/features/friend_name/friend_name_state.dart';
import 'package:flutter_app_template/navigation/navigate_to_choose_relation_type_page.dart';
import 'package:template_package/template_package.dart';

class FriendNameBloc extends TemplateBloc {
  final Celebrated friend = Celebrated(birthdayCars: []);
  final TextEditingController textEditingController = TextEditingController();

  final StreamController myDataStateController = StreamController<FriendNameState>();

  FriendNameBloc(BaseAnalytics analytics) : super(analytics, analyticFrameworkTypes: [UxCamImpl]) {
    registerStreams([myDataStateController.stream]);
    init();
  }

  void init() {
    textEditingController.addListener(() {
      myDataStateController.sink.add(FriendNameState(
          textEditingController: textEditingController,
          isButtonEnabled: textEditingController.text.isNotEmpty));
    });
    myDataStateController.sink.add(FriendNameState(
        textEditingController: textEditingController,
        isButtonEnabled: textEditingController.text.isNotEmpty));
  }

  @override
  void onUiDataChange(BaseBlocEvent event) {
    if (event is ContinueButtonClickEvent) {
      chooseFriendPersonalities();
    }
  }

  void chooseFriendPersonalities() {
    friend.name = textEditingController.text;
    sinkState?.add(NavigateToChooseRelationTypePage(friend: friend));
    logEvent('continue_from_person_name_page',
        sendTo: [UxCamImpl], properties: {EventProperties.PERSON_NAME: friend.name});
  }

  @override
  void dispose() {
    myDataStateController.close();
    super.dispose();
  }
}
