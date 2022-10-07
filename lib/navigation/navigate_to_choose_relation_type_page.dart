import 'package:flutter/material.dart';
import 'package:flutter_app_template/core/models/celebrated.dart';
import 'package:flutter_app_template/dependency/dependency_provider.dart';
import 'package:flutter_app_template/features/choose_relation_type/choose_relation_type_page.dart';
import 'package:template_package/template_package.dart';

class NavigateToChooseRelationTypePage extends BaseBlocPrimaryState {
  final Function(dynamic result)? onPop;
  final Celebrated friend;

  NavigateToChooseRelationTypePage({
    this.onPop,
    required this.friend,
  }) : super();

  @override
  call(context) async {
    final result = await Navigator.push(
        context,
        MaterialPageRoute(
            settings: const RouteSettings(name: 'choose_relation_type_page'),
            builder: (context) => ChooseRelationTypePage(
                () => DProvider.of(context)!.blocSubModule.chooseRelationTypeBloc(friend))));
    onPop?.call(result);
  }
}
