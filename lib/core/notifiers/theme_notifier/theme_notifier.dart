import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_template/theme/theme_primary/app_theme_dark.dart';
import 'package:flutter_app_template/theme/theme_primary/app_theme_light_one.dart';

class ThemeNotifier extends ValueNotifier<ThemeData> {
  ThemeNotifier(ThemeData value) : super(value);

  void switchToDark() => value = getDarkMode();

  void switchToLight() => value = appThemeLight;

  bool isDark() => value == getDarkMode();

  ThemeData getDarkMode() => appThemeDark;

  ThemeData getLightMode() => appThemeLight;
}
