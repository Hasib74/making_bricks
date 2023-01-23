import 'package:flutter/material.dart';

import '../../featchers/splash/splash_screen.dart';


class AppRoutes {
  static String SPLASH_SCREEN = "/";
  static getAppRoutes() {
    return {
      SPLASH_SCREEN: (BuildContext context) => const SplashScreen(),
    };
  }
}
