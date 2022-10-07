import 'package:template_package/template_package.dart';

class FriendNameEvent extends BaseBlocEvent {
  final dynamic variable;

  FriendNameEvent(String? analyticEventName, this.variable) : super(analyticEventName);
}