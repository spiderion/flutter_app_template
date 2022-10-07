import 'dart:async';

import 'package:flutter_app_template/core/analytics/analytic_events.dart';
import 'package:flutter_app_template/core/analytics/ux_cam_impl.dart';
import 'package:flutter_app_template/core/data/personalities.dart';
import 'package:flutter_app_template/core/events/common_events.dart';
import 'package:flutter_app_template/core/models/celebrated.dart';
import 'package:flutter_app_template/core/models/ui_models/item_text.dart';
import 'package:flutter_app_template/features/personalities/personalities_event.dart';
import 'package:flutter_app_template/features/personalities/personalities_state.dart';
import 'package:flutter_app_template/navigation/navigate_to_friend_profile_page.dart';
import 'package:template_package/template_package.dart';

class PersonalitiesBloc extends TemplateBloc {
  final List<ItemText> personalities = Personalities().getPersonalities();
  final int minPersonalities = 2;
  final int max = 5;
  final Celebrated friend;
  final StreamController personalitiesDataStateController = StreamController<PersonalitiesDataState>();

  PersonalitiesBloc(BaseAnalytics analytics, this.friend)
      : super(analytics, analyticFrameworkTypes: [UxCamImpl]) {
    registerStreams([personalitiesDataStateController.stream]);
    init();
  }

  void init() {
    personalitiesDataStateController.sink.add(PersonalitiesDataState(shouldEnableButton(), personalities));
  }

  bool shouldEnableButton() =>
      personalities.where((element) => element.isSelected).length >= minPersonalities;

  @override
  void onUiDataChange(BaseBlocEvent event) {
    if (event is ContinueButtonClickEvent) {
      continueTapEvent();
    } else if (event is PersonalityTapEvent) {
      event.personality.isSelected = !event.personality.isSelected;
      personalitiesDataStateController.sink.add(PersonalitiesDataState(shouldEnableButton(), personalities));
    } else if (event is RemovePersonalityTapEvent) {
      personalities.firstWhere((ItemText element) => element.name == event.personalityName).isSelected =
          false;
      personalitiesDataStateController.sink.add(PersonalitiesDataState(shouldEnableButton(), personalities));
    }
  }

  void continueTapEvent() {
    friend.personalities =
        personalities.where((element) => element.isSelected).toList().map((e) => e.name).toList();
    sinkState?.add(NavigateToFriendProfilePage(friend: friend));
    logEvent('continue_from_person_name_page', sendTo: [
      UxCamImpl
    ], properties: {
      EventProperties.CHOSEN_PERSONALITIES: friend.personalities.toString(),
    });
  }

  @override
  void dispose() {
    personalitiesDataStateController.close();
    super.dispose();
  }
}
