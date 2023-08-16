import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../constants/color_constants.dart';

@immutable
class LightTheme {
  const LightTheme._();

  static final ThemeData lightTheme = ThemeData.light(
    useMaterial3: true,
  ).copyWith(
    scaffoldBackgroundColor: ColorConstants.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: ColorConstants.transparent,
      foregroundColor: ColorConstants.black,
      titleTextStyle: TextStyle(
        color: ColorConstants.black,
        fontSize: 20,
        fontWeight: FontWeight.w400,
      ),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: ColorConstants.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: ColorConstants.green,
      unselectedItemColor: ColorConstants.grey,
    ),
    tabBarTheme: const TabBarTheme(
      labelColor: ColorConstants.green,
      indicatorColor: ColorConstants.green,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: ColorConstants.green,
    ),
  );
}
