import 'dart:async';

import 'package:flutter_app_template/core/use_cases/user_use_case.dart';
import 'package:flutter_app_template/features/initial/root_state.dart';
import 'package:template_package/analytics/base_analytics.dart';
import 'package:template_package/error_state.dart';
import 'package:template_package/template_bloc/template_bloc.dart';
import 'package:template_package/template_package.dart';

class InitialBloc extends TemplateBloc {
  final UserUseCase userUseCase;
  final StreamController backgroundColor = StreamController<BackgroundColorDateState>();

  InitialBloc(BaseAnalytics analytics, this.userUseCase) : super(analytics) {
    registerStreams([backgroundColor.stream]);
    init();
  }

  void init() {
    userUseCase.getUserName(onSuccess: (String v) {
      backgroundColor.sink.add(BackgroundColorDateState(v));
    }, onError: (Error e) {
      sinkState?.add(ErrorState(error: e));
    });
  }

  @override
  void onUiDataChange(BaseBlocEvent event) {
    // TODO: implement onUiDataChange
  }

  @override
  void dispose() {
    backgroundColor.close();
    super.dispose();
  }
}
