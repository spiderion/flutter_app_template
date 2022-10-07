import 'package:flutter_app_template/core/models/birthday_card.dart';

class Celebrated {
  String? id;
  String? name;
  String? relationType;
  List<String> personalities = [];
  List<BirthdayCard> birthdayCars;

  static const id_key = "id";
  static const name_key = "name";
  static const relationType_key = "relationType";
  static const personalities_key = "personalities";
  static const birthdayCars_key = "birthdayCars";

  Celebrated({this.id, this.name, required this.birthdayCars});

  Map<String, dynamic> toJson() {
    return {
      id_key: id,
      name_key: name,
      relationType_key: relationType,
      personalities_key: personalities,
      birthdayCars_key: birthdayCars,
    };
  }

  Celebrated.fromJson(Map<String, dynamic> json)
      : id = json[id_key],
        name = json[name_key],
        relationType = json[relationType_key],
        personalities = json[personalities_key] ?? [],
        birthdayCars = json[birthdayCars_key] ?? [];
}
