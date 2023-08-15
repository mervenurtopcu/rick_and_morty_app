import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:rick_and_morty_app/features/home/home_screen.dart';
import 'package:rick_and_morty_app/features/splash/splash_screen_provider.dart';
import '../../product/constants/string_constants.dart';
import '../../product/enums/jpg_enums.dart';
import '../../product/global/utils.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState createState() => _SpashScreenState();
}

class _SpashScreenState extends ConsumerState<SplashScreen> {
  Timer? timer;
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      _checkUserConnection();
    });
  }

  @override
  void dispose() {
    super.dispose();
    timer!.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration:  BoxDecoration(
          image: DecorationImage(
            image: AssetImage(JpgEnums.splash.toJpg),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }

  Future _checkUserConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        _runTimer();
        timer?.cancel();
        ref.watch(splashScreenProvider).refresh = true;
      }
    } on SocketException catch (_) {
      if (!ref.watch(splashScreenProvider).refresh && _counter == 0) {
        Utils.showSnackBar(StringConstants.splashScreenConnectionError);
        _counter++;
      }
    }
  }

  void _runTimer() {
    Future.delayed(
      const Duration(seconds: 2),
          () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const HomeScreen(),));
      },
    );
  }
}