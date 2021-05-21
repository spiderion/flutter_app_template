import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app_template/dependency/sub_modules/bloc_sub_module.dart';
import 'package:template_package/template_package.dart';

import 'features/initial/initial_page.dart';

class App extends StatelessWidget {
  final List<ISubModule> subModules;

  const App({Key? key, required this.subModules}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocSubModule blocSubModule =
        subModules.singleWhere((ISubModule element) => element is BlocSubModule) as BlocSubModule;
    return MaterialApp(home: InitialPage(() => blocSubModule.initialBloc()));
  }
}
