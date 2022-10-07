import 'package:flutter/material.dart';
import 'package:flutter_app_template/core/constants/material_constants/material_constants.dart';
import 'package:flutter_app_template/core/events/common_events.dart';
import 'package:flutter_app_template/core/models/ui_models/item_text.dart';
import 'package:flutter_app_template/features/personalities/personalities_event.dart';
import 'package:flutter_app_template/features/personalities/personalities_state.dart';
import 'package:flutter_app_template/widgets/back/back_arrow_widget.dart';
import 'package:template_package/base_widget/base_widget.dart';
import 'package:template_package/template_package.dart';

class PersonalitiesPage extends BaseWidget {
  PersonalitiesPage(BaseBloc Function() getBloc) : super(getBloc);

  @override
  _PersonalitiesPageState createState() => _PersonalitiesPageState();
}

class _PersonalitiesPageState extends BaseState<PersonalitiesPage, BaseBloc> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: bloc.getStreamOfType<PersonalitiesDataState>(),
        builder: (context, AsyncSnapshot<PersonalitiesDataState> snapshot) {
          return Scaffold(
              appBar: AppBar(
                leading: BackArrowWidget(),
              ),
              persistentFooterButtons: [button(snapshot)],
              body: mainContent(snapshot.data));
        });
  }

  Center button(AsyncSnapshot<PersonalitiesDataState> snapshot) {
    return Center(
      child: ElevatedButton(
          onPressed: snapshot.data?.isButtonEnabled == true
              ? () {
                  bloc.event.add(ContinueButtonClickEvent(''));
                }
              : null,
          child: Text(
            translate('continue'),
          )),
    );
  }

  Widget mainContent(PersonalitiesDataState? state) {
    if (state == null) return SizedBox.shrink();
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Text(
            translate('choose_few_personalities_that_describe_your_friend'),
            style: MaterialTextStyles.H2,
          ),
        ),
        SizedBox(height: 8),
        selectedPersonalities(state),
        SizedBox(height: 8),
        Expanded(
            child: Scrollbar(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
                itemCount: state.personalities.length,
                gridDelegate:
                    SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 5 / 2),
                itemBuilder: (context, index) => buildItem(state.personalities[index])),
          ),
        )),
      ],
    );
  }

  Widget selectedPersonalities(PersonalitiesDataState state) {
    final selected = (state.getSelectedPersonalities()).map((e) => buildSelectedItem(e)).toList();
    if (selected.isEmpty) return SizedBox(height: 40);
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

  Widget buildSelectedItem(String e) {
    return InkWell(
      onTap: () {
        bloc.event.add(RemovePersonalityTapEvent(
          'remove_personality_tap',
          personalityName: e,
        ));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: Chip(
            label: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Text(
                e,
                strutStyle: StrutStyle(),
                style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
              ),
            ),
            SizedBox(width: 14),
            Icon(Icons.cancel_rounded)
          ],
        )),
      ),
    );
  }

  Widget buildItem(ItemText personality) {
    final radius = 20.0;
    return InkWell(
      borderRadius: BorderRadius.circular(radius),
      onTap: () {
        bloc.event.add(PersonalityTapEvent('personality_tap_event', personality: personality));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
        child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(radius), color: personality.color),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(120),
                    boxShadow: [
                      BoxShadow(blurRadius: 10, spreadRadius: 12, color: Colors.black26),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      personality.name,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onSecondary,
                          fontSize: MaterialFontSize.GENERAL_TEXT,
                          fontWeight: MaterialFontWeight.MEDIUM),
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
