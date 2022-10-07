import 'package:flutter_app_template/core/models/birthday_card.dart';
import 'package:template_package/template_package.dart';


class CreateBirthdayCardEvent extends BaseBlocEvent {
  final dynamic variable;

  CreateBirthdayCardEvent(String analytic, {this.variable}) : super(analytic);
}

class CardTapEvent extends BaseBlocEvent {
  final BirthdayCard birthdayCard;

  CardTapEvent(String analytic, {required this.birthdayCard}) : super(analytic);
}

class SaveFriendEvent extends BaseBlocEvent {
  final dynamic variable;

  SaveFriendEvent(String analytic, {this.variable}) : super(analytic);
}
