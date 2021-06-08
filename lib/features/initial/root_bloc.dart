import 'dart:async';

import 'package:flutter_app_template/core/models/some_model.dart';
import 'package:flutter_app_template/core/use_cases/user_use_case.dart';
import 'package:flutter_app_template/features/initial/root_event.dart';
import 'package:flutter_app_template/features/initial/root_state.dart';
import 'package:template_package/analytics/base_analytics.dart';
import 'package:template_package/error_state.dart';
import 'package:template_package/template_bloc/template_bloc.dart';
import 'package:template_package/template_package.dart';

class RootBloc extends TemplateBloc {
  final String appName;
  final SomeUseCase someUseCase;
  final StreamController initialDataStateController = StreamController<InitialDataState>();

  RootBloc(BaseAnalytics analytics, this.someUseCase, this.appName) : super(analytics) {
    registerStreams([initialDataStateController.stream]);
    init();
  }

  void init() {
    initialDataStateController.sink.add(InitialDataState(text: 'Initial data:', appName: appName));
  }

  @override
  void onUiDataChange(BaseBlocEvent event) {
    if (event is SaveDataEvent) {
      saveData(event.data);
    } else if (event is GetDataEvent) {
      fetchData();
    }
  }

  void fetchData() {
    someUseCase.getSomeData(onSuccess: (SomeModel someModel) {
      initialDataStateController.sink.add(InitialDataState(
          text: 'from database:',
          appName: appName,
          someData: someModel.someData.toUpperCase(),
          isHorizontalStyle: true));
    }, onError: (Error e) {
      sinkState?.add(ErrorState(error: e));
    });
  }

  void saveData(String data) {
    final someModel = SomeModel('some data');
    someUseCase.setSomeData(someModel, onSuccess: () {
      Fluttertoast.showToast(msg: 'saved');
    }, onError: (Error error) {
      Fluttertoast.showToast(msg: 'error');
      // todo  sinkState?.add(ErrorMessage());
    });
  }

  @override
  void dispose() {
    initialDataStateController.close();
    super.dispose();
  }
}
