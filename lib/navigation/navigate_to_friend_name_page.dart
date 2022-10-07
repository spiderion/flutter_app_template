import 'package:flutter/material.dart';
import 'package:flutter_app_template/dependency/dependency_provider.dart';
import 'package:flutter_app_template/features/friend_name/friend_name_page.dart';
import 'package:template_package/template_package.dart';

class NavigateToFriendNamePage extends BaseBlocPrimaryState {
  final Function(dynamic result)? onPop;

  NavigateToFriendNamePage({
    this.onPop,
  }) : super();

  @override
  call(context) async {
    final result = await Navigator.push(
        context,
        MaterialPageRoute(
            settings: const RouteSettings(name: 'friend_name_page'),
            builder: (context) =>
                FriendNamePage(() => DProvider.of(context)!.blocSubModule.friendNameBloc())));
    onPop?.call(result);
  }
}
