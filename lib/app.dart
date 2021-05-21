import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'initial_page.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: InitialPage());
  }
}
