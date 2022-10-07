import 'package:flutter/material.dart';
import 'package:flutter_app_template/core/navigation_observers/navigation_observer.dart';
import 'package:flutter_app_template/dependency/sub_modules/core_sub_module.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:template_package/template_package.dart';

import 'core/abr/first_page_launcher_abr.dart';
import 'core/notifiers/theme_notifier/theme_notifier.dart';
import 'dependency/sub_modules/abr_sub_module.dart';
import 'dependency/sub_modules/locale_sub_module.dart';
import 'dependency/sub_modules/value_notifier_sub_module.dart';

class App extends StatefulWidget {
  final List<ISubModule> subModules;

  const App(this.subModules, {Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    getThemeNotifier().addListener(() => setState(() {}));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final CoreSubModule coreSubModule =
        widget.subModules.firstWhere((element) => element is CoreSubModule) as CoreSubModule;
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      theme: getThemeNotifier().value,
      navigatorObservers: [DefaultNavigationObserver(analytics: coreSubModule.analytics())],
      home: FutureBuilder(
          future: getPageLauncher().decideFirstScreen(),
          builder: (context, AsyncSnapshot<Widget> snapshot) {
            if (snapshot.hasData) {
              return snapshot.data!;
            } else if (snapshot.hasError) {
              return getPageLauncher().getConnectionErrorPage();
            } else {
              return Scaffold(body: Center(/*app logo image*/));
            }
          }),
      localizationsDelegates: [
        getTranslationDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: getTranslationDelegate().supportedLocales,
    );
  }

  FirstPageLauncherABR getPageLauncher() {
    return widget.subModules.whereType<ABRSubModule>().first.firstPageLauncherABR();
  }

  TranslationsDelegate getTranslationDelegate() =>
      widget.subModules.whereType<LocaleSubModule>().first.translationDelegateInstance();

  ThemeNotifier getThemeNotifier() =>
      (widget.subModules.singleWhere((element) => element is ValueNotifierSubModule)
              as ValueNotifierSubModule)
          .themeNotifier;
}
