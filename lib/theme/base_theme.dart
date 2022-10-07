import 'package:flutter/material.dart';
import 'package:flutter_app_template/core/constants/material_constants/material_constants.dart';

ThemeData baseTheme = ThemeData(
    colorScheme: baseColorScheme,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(backgroundColor: Colors.red),
    cardTheme: CardTheme(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
    appBarTheme: AppBarTheme(elevation: 0, backgroundColor: baseColorScheme.background, centerTitle: true),
    textTheme: _textTheme,
    shadowColor: Colors.black12,
    elevatedButtonTheme: _elevatedButtonTheme,
    outlinedButtonTheme: _outlineButtonThemeData(),
    dialogTheme: DialogTheme(
        backgroundColor: baseColorScheme.background,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(MaterialConstants.ALERT_DIALOG_RADIUS)),
        contentTextStyle: TextStyle()),
    buttonTheme: ButtonThemeData(buttonColor: baseColorScheme.primary, shape: StadiumBorder()),
    fontFamily: MaterialFont.PRIMARY);

ElevatedButtonThemeData _elevatedButtonTheme = ElevatedButtonThemeData(
    style: ButtonStyle(
        padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 20)),
        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)))));

TextTheme _textTheme = TextTheme(headline6: _appBarTextStyle);

TextStyle _appBarTextStyle = TextStyle(fontWeight: MaterialFontWeight.BOLD);

OutlinedButtonThemeData _outlineButtonThemeData() => OutlinedButtonThemeData(
        style: ButtonStyle(
      shape: MaterialStateProperty.all(StadiumBorder()),
      side: MaterialStateProperty.all(BorderSide(color: colorPalette1)),
    ));

ColorScheme baseColorScheme = ColorScheme.dark(
    primary: colorPalette1,
    onPrimary: Color(0xFFFFFFFF),
    secondary: Color(0xFFB83B5E),
    onSecondary: Color(0xFFFFFFFF),
    secondaryContainer: colorPalette4,
    background: Colors.grey,
    error: Color(0xFFB00020),
    onError: Color(0xFFFFFFFF));

const colorPalette1 = Color(0xFF6A2C70);
const colorPalette2 = Color(0xFFB83B5E);
const colorPalette3 = Color(0xFFF08A5D);
const colorPalette4 = Color(0xFFF9ED69);
