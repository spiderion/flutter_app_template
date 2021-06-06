import 'dart:async';

import 'package:flutter_app_template/core/use_cases/user_use_case.dart';
import 'package:flutter_app_template/features/initial/root_state.dart';
import 'package:template_package/analytics/base_analytics.dart';
import 'package:template_package/error_state.dart';
import 'package:template_package/template_bloc/template_bloc.dart';
import 'package:template_package/template_package.dart';

class InitialBloc extends TemplateBloc {
  final String appName;
  final UserUseCase userUseCase;
  final StreamController initialDataStateController = StreamController<InitialDataState>();

  InitialBloc(BaseAnalytics analytics, this.userUseCase, this.appName) : super(analytics) {
    registerStreams([initialDataStateController.stream]);
    init();
  }

  void init() {
    initialDataStateController.sink.add(InitialDataState('Initial data:', appName));
    userUseCase.getUserName(onSuccess: (String userName) {
      initialDataStateController.sink.add(InitialDataState('from database:', userName));
    }, onError: (Error e) {
      sinkState?.add(ErrorState(error: e));
    });
  }

  @override
  void onUiDataChange(BaseBlocEvent event) {
    // TODO: implement onUiDataChange events
  }

  @override
  void dispose() {
    initialDataStateController.close();
    super.dispose();
  }
}
