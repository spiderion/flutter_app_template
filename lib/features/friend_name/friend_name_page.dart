import 'package:flutter/material.dart';
import 'package:flutter_app_template/core/constants/material_constants/material_constants.dart';
import 'package:flutter_app_template/core/events/common_events.dart';
import 'package:flutter_app_template/features/friend_name/friend_name_state.dart';
import 'package:flutter_app_template/widgets/back/back_arrow_widget.dart';
import 'package:template_package/base_widget/base_widget.dart';
import 'package:template_package/template_package.dart';

class FriendNamePage extends BaseWidget {
  FriendNamePage(BaseBloc Function() getBloc) : super(getBloc);

  @override
  _FriendNamePageState createState() => _FriendNamePageState();
}

class _FriendNamePageState extends BaseState<FriendNamePage, BaseBloc> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: bloc.getStreamOfType<FriendNameState>(),
        builder: (context, AsyncSnapshot<FriendNameState> snapshot) {
          return Scaffold(
              appBar: AppBar(
                leading: BackArrowWidget(),
              ),
              persistentFooterButtons: [
                Center(
                  child: ElevatedButton(
                      onPressed: snapshot.data?.isButtonEnabled == true
                          ? () {
                              bloc.event.add(ContinueButtonClickEvent(''));
                            }
                          : null,
                      child: Text(
                        translate('continue'),
                      )),
                ),
              ],
              body: mainContent(snapshot.data));
        });
  }

  Widget mainContent(FriendNameState? state) {
    if (state == null) return SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            translate('friend_name_description'),
            style: MaterialTextStyles.H2,
          ),
          TextField(
            controller: state.textEditingController,
            textCapitalization: TextCapitalization.words,
          )
        ],
      ),
    );
  }
}
