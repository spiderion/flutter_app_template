import 'dart:async';

import 'package:flutter_app_template/core/analytics/ux_cam_impl.dart';
import 'package:flutter_app_template/core/data/relation_types.dart';
import 'package:flutter_app_template/core/events/common_events.dart';
import 'package:flutter_app_template/core/models/celebrated.dart';
import 'package:flutter_app_template/core/models/ui_models/item_text.dart';
import 'package:flutter_app_template/features/choose_relation_type/choose_relation_type_event.dart';
import 'package:flutter_app_template/features/choose_relation_type/choose_relation_type_state.dart';
import 'package:flutter_app_template/navigation/navigate_to_personalities_page.dart';
import 'package:template_package/template_package.dart';

class ChooseRelationTypeBloc extends TemplateBloc {
  final List<ItemText> relationTypes = RelationTypes().getRelationTypes();

  final Celebrated friend;
  final StreamController chooseRelationTypeDataStateController =
      StreamController<ChooseRelationTypeDataState>();

  ChooseRelationTypeBloc(BaseAnalytics analytics, {required this.friend})
      : super(analytics, analyticFrameworkTypes: [UxCamImpl]) {
    registerStreams([chooseRelationTypeDataStateController.stream]);
    init();
  }

  void init() {
    chooseRelationTypeDataStateController.sink.add(ChooseRelationTypeDataState(relationTypes));
  }

  @override
  void onUiDataChange(BaseBlocEvent event) {
    if (event is ContinueButtonClickEvent) {
      chooseFriendPersonalities();
    } else if (event is RelationTypeSelectedEvent) {
      friend.relationType = event.relationType.name;
      chooseFriendPersonalities();
    }
  }

  void chooseFriendPersonalities() {
    sinkState?.add(NavigateToPersonalitiesPage(friend: friend));
  }

  @override
  void dispose() {
    chooseRelationTypeDataStateController.close();
    super.dispose();
  }
}
