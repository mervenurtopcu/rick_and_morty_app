import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/product/constants/color_constants.dart';

class Utils {
  Utils._();

  static final GlobalKey<ScaffoldMessengerState> messengerKey =
      GlobalKey<ScaffoldMessengerState>();

  static showSnackBar(String? text) {
    if (text == null) return;
    final snackBar = SnackBar(
      content: Text(text,style: const TextStyle(color: ColorConstants.white),),
      backgroundColor: Colors.red,
    );
    messengerKey.currentState!
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}
