import 'package:flutter/material.dart';
import 'package:flutter_app_template/core/constants/material_constants/material_constants.dart';
import 'package:flutter_app_template/core/events/common_events.dart';
import 'package:flutter_app_template/core/models/ui_models/item_text.dart';
import 'package:flutter_app_template/features/choose_relation_type/choose_relation_type_event.dart';
import 'package:flutter_app_template/features/choose_relation_type/choose_relation_type_state.dart';
import 'package:flutter_app_template/widgets/back/back_arrow_widget.dart';
import 'package:template_package/base_widget/base_widget.dart';
import 'package:template_package/template_package.dart';

class ChooseRelationTypePage extends BaseWidget {
  ChooseRelationTypePage(BaseBloc Function() getBloc) : super(getBloc);

  @override
  _ChooseRelationTypePageState createState() => _ChooseRelationTypePageState();
}

class _ChooseRelationTypePageState extends BaseState<ChooseRelationTypePage, BaseBloc> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: bloc.getStreamOfType<ChooseRelationTypeDataState>(),
        builder: (context, AsyncSnapshot<ChooseRelationTypeDataState> snapshot) {
          return Scaffold(
              appBar: AppBar(
                leading: BackArrowWidget(),
              ),
              persistentFooterButtons: [button(snapshot)],
              body: mainContent(snapshot.data));
        });
  }

  Center button(AsyncSnapshot<ChooseRelationTypeDataState> snapshot) {
    return Center(
      child: ElevatedButton(
          onPressed: () {
            bloc.event.add(ContinueButtonClickEvent(''));
          },
          child: Text(
            translate('continue'),
          )),
    );
  }

  Widget mainContent(ChooseRelationTypeDataState? state) {
    if (state == null) return SizedBox.shrink();
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Text(
            translate('choose_the_type_of_relation_you_have_with_the_celebrated_person'),
            style: MaterialTextStyles.H2,
          ),
        ),
        SizedBox(height: 8),
        Expanded(
            child: Scrollbar(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
                itemCount: state.relationType.length,
                gridDelegate:
                    SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1, childAspectRatio: 5 / 2),
                itemBuilder: (context, index) => buildItem(state.relationType[index])),
          ),
        )),
      ],
    );
  }

  Widget buildItem(ItemText relationType) {
    final radius = 20.0;
    return InkWell(
      borderRadius: BorderRadius.circular(radius),
      onTap: () {
        bloc.event.add(RelationTypeSelectedEvent('relation_type_tap_event', relationType: relationType));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
        child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(radius), color: relationType.color),
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
                      relationType.name,
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
