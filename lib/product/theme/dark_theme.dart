import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../constants/color_constants.dart';

@immutable
class DarkTheme {
  const DarkTheme._();

  static final ThemeData darkTheme = ThemeData.dark(
    useMaterial3: true,
  ).copyWith(
    scaffoldBackgroundColor: ColorConstants.black,
    appBarTheme: const AppBarTheme(
      backgroundColor: ColorConstants.transparent,
      foregroundColor: ColorConstants.white,
      titleTextStyle: TextStyle(
        color: ColorConstants.white,
        fontSize: 20,
        fontWeight: FontWeight.w400,
      ),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: ColorConstants.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
    ),
  );
}