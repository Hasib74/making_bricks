import 'package:flutter/material.dart';

class SplashScreenFunctions {
  init(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 3));

    // await BlocProvider.of<Splash>(context).getProductData();
    //
    // Navigator.pushNamedAndRemoveUntil(
    //     context, AppRoutes.HOME_SCREEN, (route) => false);
  }
}
