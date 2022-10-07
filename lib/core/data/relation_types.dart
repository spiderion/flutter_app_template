import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_app_template/core/models/ui_models/item_text.dart';

class RelationTypes {
  final _relationTypes = [
    'Friend',
    'GirlFriend',
    'BoyFriend',
    'Work Colleague',
    'Boss',
    'Manager',
    'Employee'
  ];

  List<ItemText> getRelationTypes() {
    return _relationTypes.map((e) {
      final color = Colors.primaries[Random().nextInt(Colors.primaries.length)];
      return ItemText(name: e, color: color);
    }).toList();
  }
}
