import 'package:flutter/material.dart';
import 'package:flutter_app_template/core/models/birthday_card.dart';

class CardBirthdayWidget extends StatelessWidget {
  final BirthdayCard birthdayCard;

  const CardBirthdayWidget({required this.birthdayCard, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16),
        child: Text(birthdayCard.text),
      ),
    );
  }
}
