import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class SplashScreenProvider extends ChangeNotifier{
  bool _refresh = false;
  bool get refresh => _refresh;
  set refresh(bool value) {
    _refresh = value;
    notifyListeners();
  }
}

final splashScreenProvider = ChangeNotifierProvider((ref) =>SplashScreenProvider() );