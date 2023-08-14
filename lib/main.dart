import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/product/constants/app_constants.dart';
import 'package:rick_and_morty_app/product/global/utils.dart';
import 'package:rick_and_morty_app/product/services/shared_manager.dart';
import 'package:rick_and_morty_app/product/theme/index.dart';


import 'features/splash/splash_screen.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedManager.init();
  runApp(const ProviderScope(child: MyApp()));
}


class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return  MaterialApp(
        title: AppConstants.materialAppTitle,
        debugShowCheckedModeBanner: false,
        scaffoldMessengerKey: Utils.messengerKey,
        theme: ref.watch(themeProvider).isDarkTheme ? DarkTheme.darkTheme :LightTheme.lightTheme,
        home: const SpashScreen()
    );
  }
}