import 'package:flutter_app_template/core/models/ui_models/item_text.dart';
import 'package:template_package/template_package.dart';

class PersonalitiesEvent extends BaseBlocEvent {
  final dynamic variable;

  PersonalitiesEvent(String? analyticEventName, this.variable) : super(analyticEventName);
}

class PersonalityTapEvent extends BaseBlocEvent {
  final ItemText personality;

  PersonalityTapEvent(String analytic, {required this.personality}) : super(analytic);
}

class RemovePersonalityTapEvent extends BaseBlocEvent {
  final String personalityName;

  RemovePersonalityTapEvent(String analytic, {required this.personalityName}) : super(analytic);
}
