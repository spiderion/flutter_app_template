import 'package:flutter/material.dart';
import 'package:template_package/template_package.dart';

class FriendNameState extends BaseBlocDataState {
  final TextEditingController textEditingController;
  final bool isButtonEnabled;

  FriendNameState({required this.textEditingController, required this.isButtonEnabled});
}
