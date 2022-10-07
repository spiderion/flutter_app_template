import 'package:flutter/material.dart';
import 'package:flutter_app_template/core/models/celebrated.dart';
import 'package:flutter_app_template/dependency/dependency_provider.dart';
import 'package:flutter_app_template/features/personalities/personalities_page.dart';
import 'package:template_package/template_package.dart';

class NavigateToPersonalitiesPage extends BaseBlocPrimaryState {
  final Function(dynamic result)? onPop;
  final Celebrated friend;

  NavigateToPersonalitiesPage({this.onPop, required this.friend}) : super();

  @override
  call(context) async {
    final result = await Navigator.push(
        context,
        MaterialPageRoute(
            settings: const RouteSettings(name: 'Personalities_page'),
            builder: (context) =>
                PersonalitiesPage(() => DProvider.of(context)!.blocSubModule.personalitiesBloc(friend))));
    onPop?.call(result);
  }
}
