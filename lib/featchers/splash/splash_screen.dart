import 'package:flutter/material.dart';
import 'package:gdn_health/core/utils/app_assets.dart';
import 'package:gdn_health/core/utils/app_colors.dart';

import '../../core/dependencyInjection/app_dependency_injections.dart';
import '../../core/flavor/app_flavor.dart';
import 'functions/splash_screen_functions.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    sl<SplashScreenFunctions>().init(context);

    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(sl<FlavorConfig>().flavorConfig!.flavor.toString()),
        ),
      ),
    );
  }
}
