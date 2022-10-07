import 'package:flutter_app_template/core/models/birthday_card.dart';
import 'package:template_package/template_package.dart';

class FriendProfileDataState extends BaseBlocDataState {
  final String friendName;
  final List<BirthdayCard>? birthdayCards;
  final List<String> personalities;

  FriendProfileDataState({
    required this.friendName,
    required this.personalities,
    this.birthdayCards,
  });
}
