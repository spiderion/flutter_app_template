import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app_template/features/initial/root_state.dart';
import 'package:template_package/base_widget/base_widget.dart';
import 'package:template_package/template_bloc/template_bloc.dart';
import 'package:template_package/template_package.dart';

class RootPage extends BaseWidget {
  RootPage(TemplateBloc Function() getBloc) : super(getBloc);

  @override
  _RoorPageState createState() => _RoorPageState();
}

class _RoorPageState extends BaseState<RootPage, BaseBloc> {
  @override
  Widget build(BuildContext context) {
    return mainWidget();
  }

  Widget mainWidget() {
    return StreamBuilder<InitialDataState>(
        stream: bloc.getStreamOfType<InitialDataState>(),
        builder: (BuildContext context, AsyncSnapshot<InitialDataState> snapshot) {
          return Scaffold(
              appBar: AppBar(centerTitle: true, title: Text(snapshot.data?.appName ?? "")),
              body: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  getCustomWidget(),
                  SizedBox(height: 50),
                  Text('${translate('root_page')}'),
                  SizedBox(height: 20),
                  Text('${translate('welcome_to')} ${snapshot.data?.appName ?? ''}'),
                ],
              )));
        });
  }

  Widget getCustomWidget() {
    return FlutterLogo(size: 100);
  }
}
