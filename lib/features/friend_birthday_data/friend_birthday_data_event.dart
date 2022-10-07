import 'package:template_package/template_package.dart';

class FriendBirthdayDataEvent extends BaseBlocEvent {
  final dynamic variable;

  FriendBirthdayDataEvent(String? analyticEventName, this.variable) : super(analyticEventName);
}