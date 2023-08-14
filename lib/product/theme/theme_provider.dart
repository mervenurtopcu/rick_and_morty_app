import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/shared_manager.dart';

class SettingsProvider extends ChangeNotifier {
  late bool isDarkTheme;
  SettingsProvider() {
    isDarkTheme = SharedManager.getBool(SharedKeys.isDarkMode) ?? false;
  }

  void setLightTheme() {
    SharedManager.setBool(SharedKeys.isDarkMode, false);
    isDarkTheme = false;
    notifyListeners();
  }

  void setDarkTheme() {
    SharedManager.setBool(SharedKeys.isDarkMode, true);
    isDarkTheme = true;
    notifyListeners();
  }
}

final themeProvider = ChangeNotifierProvider((ref) => SettingsProvider());