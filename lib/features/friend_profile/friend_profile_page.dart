import 'package:flutter/material.dart';
import 'package:flutter_app_template/core/constants/material_constants/material_constants.dart';
import 'package:flutter_app_template/core/models/birthday_card.dart';
import 'package:flutter_app_template/features/friend_profile/friend_profile_event.dart';
import 'package:flutter_app_template/features/friend_profile/friend_profile_state.dart';
import 'package:flutter_app_template/widgets/back/back_arrow_widget.dart';
import 'package:flutter_app_template/widgets/cards/card_birthday.dart';
import 'package:template_package/base_widget/base_widget.dart';
import 'package:template_package/template_package.dart';

class FriendProfilePage extends BaseWidget {
  FriendProfilePage(BaseBloc Function() getBloc) : super(getBloc);

  @override
  _FriendProfilePageState createState() => _FriendProfilePageState();
}

class _FriendProfilePageState extends BaseState<FriendProfilePage, BaseBloc> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<FriendProfileDataState>(
        stream: bloc.getStreamOfType<FriendProfileDataState>(),
        builder: (context, AsyncSnapshot<FriendProfileDataState> snapshot) {
          return Scaffold(
              appBar: AppBar(
                title: Text(
                  snapshot.data?.friendName ?? '',
                  style: MaterialTextStyles.H2,
                ),
                leading: BackArrowWidget(),
              ),
              floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
              floatingActionButton: buttons(),
              body: SafeArea(
                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(child: SizedBox(height: 30)),
                    SliverToBoxAdapter(
                      child: selectedPersonalities(snapshot.data?.personalities ?? []),
                    ),
                    buildSliverList(snapshot),
                    SliverToBoxAdapter(child: SizedBox(height: 200)),
                  ],
                ),
              ));
        });
  }

  SliverList buildSliverList(AsyncSnapshot<FriendProfileDataState> snapshot) {
    return SliverList(
        delegate: SliverChildListDelegate(
      (snapshot.data?.birthdayCards ?? []).map((e) => buildWidget(e)).toList(),
    ));
  }

  Widget buttons() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          /* Expanded(
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                Theme.of(context).colorScheme.tertiary,
              )),
              onPressed: () {
                bloc.event.add(SaveFriendEvent('save_friend_tap'));
              },
              child: Text(translate('save_friend')),
            ),
          ),*/
          // SizedBox(width: 20),
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                bloc.event.add(CreateBirthdayCardEvent('create_card_for_fiend'));
              },
              child: Text(translate('new_card')),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildWidget(BirthdayCard birthdayCard) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4),
        child: InkWell(
          onTap: () {
            bloc.event.add(CardTapEvent('card_tap_event', birthdayCard: birthdayCard));
          },
          child: CardBirthdayWidget(birthdayCard: birthdayCard),
        ));
  }

  Widget selectedPersonalities(List<String> personalities) {
    final selected = personalities
        .map((e) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Chip(
                  label: Text(
                e,
                strutStyle: StrutStyle(),
                style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
              )),
            ))
        .toList();
    if (selected.isEmpty) return SizedBox.shrink();
    return Container(
      height: 40,
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 28),
        children: selected,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
