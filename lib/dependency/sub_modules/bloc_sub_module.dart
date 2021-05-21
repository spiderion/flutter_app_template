import 'package:flutter_app_template/features/initial/initial_bloc.dart';
import 'package:template_package/template_package.dart';

import 'core_sub_module.dart';

class BlocSubModule extends ISubModule {
  late CoreSubModule _coreSubModule;

  @override
  init(List<ISubModule> subModules) {
    _coreSubModule = subModules.singleWhere((element) => element is CoreSubModule) as CoreSubModule;
  }

  InitialBloc initialBloc() => InitialBloc(_coreSubModule.analytics());
}
