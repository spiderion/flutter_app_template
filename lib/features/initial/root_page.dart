import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app_template/features/initial/root_state.dart';
import 'package:template_package/base_widget/base_widget.dart';
import 'package:template_package/template_bloc/template_bloc.dart';
import 'package:template_package/template_package.dart';

class RootPage extends BaseWidget {
  RootPage(TemplateBloc Function() getBloc) : super(getBloc);

  @override
  _InitialPageState createState() => _InitialPageState();
}

class _InitialPageState extends BaseState<RootPage, BaseBloc> {
  @override
  Widget build(BuildContext context) {
    return mainWidget();
  }

  Widget mainWidget() {
    return StreamBuilder<BackgroundColorDateState>(
        stream: bloc.getStreamOfType<BackgroundColorDateState>(),
        builder: (BuildContext context, AsyncSnapshot<BackgroundColorDateState> snapshot) {
          return Scaffold(body: Center(child: Text('First Page: ${snapshot.data?.color ?? ""}')));
        });
  }
}
