import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_app_template/core/analytics/analytic_events.dart';
import 'package:flutter_app_template/core/analytics/ux_cam_impl.dart';
import 'package:flutter_app_template/core/ebr/ai_prompt_ebr.dart';
import 'package:flutter_app_template/core/events/common_events.dart';
import 'package:flutter_app_template/core/models/ai_response.dart';
import 'package:flutter_app_template/core/models/birthday_card.dart';
import 'package:flutter_app_template/core/models/celebrated.dart';
import 'package:flutter_app_template/core/states/core_bloc_state.dart';
import 'package:flutter_app_template/core/third_party_service_wrapper/ads/abstract_ads.dart';
import 'package:flutter_app_template/core/use_cases/ai_request_use_case.dart';
import 'package:flutter_app_template/features/friend_profile/friend_profile_event.dart';
import 'package:flutter_app_template/features/friend_profile/friend_profile_state.dart';
import 'package:template_package/error_state.dart';
import 'package:template_package/primary_states/common.dart';
import 'package:template_package/template_package.dart';

class FriendProfileBloc extends TemplateBloc {
  final Celebrated? friend;
  final AiPromptEBR aiPromptEbr;
  final AbstractAds abstractAds;
  final AiRequestUseCase aiRequestUseCase;

  final StreamController friendProfileDataStateController = StreamController<FriendProfileDataState>();

  FriendProfileBloc(
    BaseAnalytics analytics, {
    required this.aiRequestUseCase,
    required this.aiPromptEbr,
    required this.abstractAds,
    this.friend,
  }) : super(analytics, analyticFrameworkTypes: [UxCamImpl]) {
    registerStreams([friendProfileDataStateController.stream]);
    init();
  }

  void init() {
    updateUI();
    fetchAiCardResult();
    abstractAds.show();
  }

  void updateUI() {
    friendProfileDataStateController.sink.add(FriendProfileDataState(
      friendName: friend?.name ?? '',
      personalities: friend?.personalities ?? [],
      birthdayCards: friend?.birthdayCars ?? [],
    ));
  }

  @override
  void onUiDataChange(BaseBlocEvent event) {
    if (event is ContinueButtonClickEvent) {
      continueTapEvent();
    } else if (event is CreateBirthdayCardEvent) {
      continueTapEvent();
    } else if (event is CardTapEvent) {
      onCardTapEvent(event.birthdayCard);
    }
  }

  void onCardTapEvent(BirthdayCard card) async {
    await Clipboard.setData(ClipboardData(text: card.text));
    Fluttertoast.showToast(msg: 'Copied on clipboard');
  }

  void continueTapEvent() {
    abstractAds.show();
    fetchAiCardResult();
  }

  void fetchAiCardResult() {
    sinkState?.add(StartProgressState());
    aiRequestUseCase.getSomeData(RequestObserver(
      requestData: aiPromptEbr.createPrompt(friend!),
      onListen: (AiResponse? result) {
        sinkState?.add(EndProgressState());
        final resultChoice = result?.choices.first.text.trim() ?? '';
        friend?.birthdayCars.insert(friend?.birthdayCars.length ?? 0, BirthdayCard('id', resultChoice));
        updateUI();
        logEvent('card_created_event', sendTo: [
          UxCamImpl
        ], properties: {
          EventProperties.PERSON_NAME: friend?.name ?? '',
          EventProperties.RELATION_TYPE: friend?.relationType ?? '',
          EventProperties.AI_CARD_RESULT: resultChoice,
        });
      },
      onError: (error) {
        sinkState?.add(EndProgressState());
        sinkState?.add(ErrorState(error: error));
      },
    ));
  }

  @override
  void dispose() {
    friendProfileDataStateController.close();
    super.dispose();
  }
}
