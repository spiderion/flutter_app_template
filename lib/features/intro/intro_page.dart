import 'package:flutter/material.dart';
import 'package:flutter_app_template/core/constants/material_constants/material_constants.dart';
import 'package:flutter_app_template/features/intro/intro_event.dart';
import 'package:flutter_app_template/features/intro/intro_state.dart';
import 'package:lottie/lottie.dart';
import 'package:template_package/base_widget/base_widget.dart';
import 'package:template_package/template_package.dart';

class IntroPage extends BaseWidget {
  IntroPage(TemplateBloc Function() getBloc) : super(getBloc);

  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends BaseState<IntroPage, BaseBloc> {
  @override
  Widget build(BuildContext context) => mainWidget();

  Widget mainWidget() {
    return StreamBuilder<IntroDataState>(
        stream: bloc.getStreamOfType<IntroDataState>(),
        builder: (BuildContext context, AsyncSnapshot<IntroDataState> snapshot) {
          return Scaffold(
              floatingActionButton: saveButton(snapshot.data?.appVersion),
              floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
              appBar: AppBar(centerTitle: true, elevation: 0),
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    title(),
                    SizedBox(height: 30),
                    appDescription(),
                    SizedBox(height: 30),
                    Expanded(child: getCustomWidget()),
                    SizedBox(height: 100),
                    SizedBox(height: 50),
                  ],
                ),
              ));
        });
  }

  Widget title() {
    return Text(
      '${translate('app_name')}',
      style: TextStyle(
        fontSize: MaterialFontSize.GENERAL_TITLE,
        fontWeight: MaterialFontWeight.BOLD,
      ),
    );
  }

  Widget appDescription() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Text(
        '${translate('app_description')}',
        textAlign: TextAlign.center,
        style: TextStyle(fontWeight: MaterialFontWeight.MEDIUM),
      ),
    );
  }

  Widget saveButton(String? appVersion) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () {
                      bloc.event.add(CreateTapEvent('create_tap_event'));
                    },
                    child: Text(translate('create'))),
              ],
            ),
          ),
        ),
        versionText(appVersion)
      ],
    );
  }

  Widget versionText(String? appVersion) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        appVersion ?? '',
        style: TextStyle(color: Colors.black26),
      ),
    );
  }

  Widget getCustomWidget() {
    return Center(
        child: Lottie.asset(
      'assets/lottie/intro_birthday.json',
    ));
  }
}
