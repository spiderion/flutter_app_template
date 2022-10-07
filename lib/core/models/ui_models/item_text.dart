import 'package:flutter/material.dart';

class ItemText {
  final String name;
  bool isSelected;
  Color color;

  ItemText({
    required this.name,
    this.isSelected = false,
    required this.color,
  });
}
