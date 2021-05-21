import 'dart:async';

import 'package:flutter_app_template/features/initial/initial_state.dart';
import 'package:template_package/analytics/base_analytics.dart';
import 'package:template_package/template_bloc/template_bloc.dart';
import 'package:template_package/template_package.dart';

class InitialBloc extends TemplateBloc {
  final StreamController backgroundColor = StreamController<BackgroundColorDateState>();

  InitialBloc(BaseAnalytics analytics) : super(analytics) {
    registerStreams([backgroundColor.stream]);
    backgroundColor.sink.add(BackgroundColorDateState("green"));
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
