import 'package:dependency_provider/base_sub_module.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app_template/dependency/sub_modules/abr_sub_module.dart';
import 'package:flutter_app_template/dependency/sub_modules/bloc_sub_module.dart';
import 'package:flutter_app_template/dependency/sub_modules/core_sub_module.dart';
import 'package:flutter_app_template/dependency/sub_modules/ebr_sub_module.dart';
import 'package:flutter_app_template/dependency/sub_modules/use_case_sub_module.dart';

import 'sub_modules/value_notifier_sub_module.dart';

class DProvider extends InheritedWidget {
  final List<ISubModule> _subModuleList;

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  ///Must be initialized only on the top of the widget three (Should Be The App Parent)
  DProvider(this._subModuleList, {required Widget child}) : super(child: child);

  static DProvider? of(BuildContext context) => context.dependOnInheritedWidgetOfExactType<DProvider>();

  ///Bloc SUBMODULE
  BlocSubModule get blocSubModule => _subModuleList.whereType<BlocSubModule>().first;

  ///UseCase SUBMODULE
  UseCaseSubModule get useCaseSubModule => _subModuleList.whereType<UseCaseSubModule>().first;

  ///List Sections SUBMODULE
  CoreSubModule get coreSubModule => _subModuleList.whereType<CoreSubModule>().first;

  ///List ValueNotifiers SUBMODULE
  ValueNotifierSubModule get valueNotifierSubModule =>
      _subModuleList.whereType<ValueNotifierSubModule>().first;

  ABRSubModule abrSubModule() => _subModuleList.whereType<ABRSubModule>().first;

  EBRSubModule ebrSubModule() => _subModuleList.whereType<EBRSubModule>().first;
}
