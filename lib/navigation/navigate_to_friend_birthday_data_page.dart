import 'package:flutter/material.dart';
import 'package:flutter_app_template/dependency/dependency_provider.dart';
import 'package:template_package/template_package.dart';
import 'package:flutter_app_template/features/friend_birthday_data/friend_birthday_data_page.dart';

class NavigateToFriendBirthdayDatePage extends BaseBlocPrimaryState {
  final Function(dynamic result)? onPop;

  NavigateToFriendBirthdayDatePage({
    this.onPop,
  }) : super();

  @override
  call(context) async {
    final result = await Navigator.push(
        context,
        MaterialPageRoute(
            settings: const RouteSettings(name: 'FriendBirthdayData_page'),
            builder: (context) =>
                FriendBirthdayDatePage(
                        () =>
                        DProvider
                            .of(context)
                        !.blocSubModule
                            .friendBirthdayDataBloc())));
    onPop?.call(result);
  }
}
