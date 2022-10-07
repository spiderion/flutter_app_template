import 'package:flutter_app_template/core/analytics/analytic_events.dart';
import 'package:flutter_app_template/core/models/ui_models/item_text.dart';
import 'package:template_package/template_package.dart';

class ChooseRelationTypeEvent extends BaseBlocEvent {
  final dynamic variable;

  ChooseRelationTypeEvent(String? analyticEventName, {this.variable}) : super(analyticEventName);
}

class RelationTypeSelectedEvent extends BaseBlocEvent {
  final ItemText relationType;

  RelationTypeSelectedEvent(String analytic, {required this.relationType})
      : super(
          analytic,
          eventProperties: {
            EventProperties.CHOSEN_PERSON_RELATION_TYPE: relationType.name,
          },
        );
}
