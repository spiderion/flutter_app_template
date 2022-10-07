import 'package:flutter/material.dart';
import 'package:flutter_app_template/core/constants/material_constants/material_constants.dart';
import 'package:flutter_app_template/core/events/common_events.dart';
import 'package:flutter_app_template/features/friend_birthday_data/friend_birthday_data_state.dart';
import 'package:flutter_app_template/widgets/back/back_arrow_widget.dart';
import 'package:template_package/base_widget/base_widget.dart';
import 'package:template_package/template_package.dart';

class FriendBirthdayDatePage extends BaseWidget {
  FriendBirthdayDatePage(BaseBloc Function() getBloc) : super(getBloc);

  @override
  _FriendBirthdayDatePageState createState() => _FriendBirthdayDatePageState();
}

class _FriendBirthdayDatePageState extends BaseState<FriendBirthdayDatePage, BaseBloc> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: bloc.getStreamOfType<FriendBirthdayDataState>(),
        builder: (context, AsyncSnapshot<FriendBirthdayDataState> snapshot) {
          return Scaffold(
              appBar: AppBar(
                leading: BackArrowWidget(),
              ),
              persistentFooterButtons: [
                Center(
                  child: ElevatedButton(
                      onPressed: () {
                        bloc.event.add(ContinueButtonClickEvent('continue_birthday_date_page'));
                      },
                      child: Text(
                        snapshot.data?.isDataEmpty == true ? translate('skip') : translate('continue'),
                      )),
                ),
              ],
              body: mainContent(snapshot.data));
        });
  }

  Widget mainContent(FriendBirthdayDataState? state) {
    if (state == null) return SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            translate('friend_birthday_date'),
            style: MaterialTextStyles.H2,
          ),
          /* TextField(
            controller: state.textEditingController,
            textCapitalization: TextCapitalization.words,
          )*/
        ],
      ),
    );
  }
}
