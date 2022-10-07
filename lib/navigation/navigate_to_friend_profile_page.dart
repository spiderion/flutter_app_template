import 'package:flutter/material.dart';
import 'package:flutter_app_template/core/models/celebrated.dart';
import 'package:flutter_app_template/dependency/dependency_provider.dart';
import 'package:flutter_app_template/features/friend_profile/friend_profile_page.dart';
import 'package:template_package/template_package.dart';

class NavigateToFriendProfilePage extends BaseBlocPrimaryState {
  final Celebrated friend;
  final Function(dynamic result)? onPop;

  NavigateToFriendProfilePage({
    required this.friend,
    this.onPop,
  }) : super();

  @override
  call(context) async {
    final result = await Navigator.push(
        context,
        MaterialPageRoute(
            settings: const RouteSettings(name: 'friend_profile_page'),
            builder: (context) =>
                FriendProfilePage(() => DProvider.of(context)!.blocSubModule.friendProfileBloc(friend))));
    onPop?.call(result);
  }
}
