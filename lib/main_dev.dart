import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gdn_health/core/flavor/app_flavor.dart';
import 'package:gdn_health/featchers/product/presentation/bloc/product_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:bloc/bloc.dart';
import 'app.dart';
import 'core/dependencyInjection/app_dependency_injections.dart';
import 'core/utils/app_colors.dart';
import 'featchers/splash/bloc/splash_screen_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await intiGetIt();

  sl<FlavorConfig>().configure(FlavorConfig(flavor: Flavor.DEV));

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: AppColors.primaryColor.withOpacity(0.6),
    ),
  );

  runApp(MultiBlocProvider(providers: [
    BlocProvider(
      create: (context) => SplashScreenCubit(),
    ),
    BlocProvider(
      create: (context) => ProductCubit(productUseCase: sl()),
    ),
  ], child: const MyApp()));
}
