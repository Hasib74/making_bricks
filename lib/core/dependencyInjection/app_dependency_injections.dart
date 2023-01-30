import '../../featchers/aktakicu/data/remoteDataSource/aktakicu_data_source.dart';
import '../../featchers/aktakicu/data/respository/aktakicu_repository_impl.dart';
import '../../featchers/aktakicu/domain/repository/aktakicu_repository.dart';

import '../../featchers/aktakicu/domain/useCase/aktakicu_use_case.dart';

import '../../featchers/aktakicu/presentation/functions/aktakicu_functions.dart';

import '../../featchers/welcome/data/remoteDataSource/welcome_data_source.dart';
import '../../featchers/welcome/data/respository/welcome_repository_impl.dart';
import '../../featchers/welcome/domain/repository/welcome_repository.dart';

import '../../featchers/welcome/domain/useCase/welcome_use_case.dart';

import '../../featchers/welcome/presentation/functions/welcome_functions.dart';

import '../../featchers/test/data/remoteDataSource/test_data_source.dart';
import '../../featchers/test/data/respository/test_repository_impl.dart';
import '../../featchers/test/domain/repository/test_repository.dart';

import '../../featchers/test/domain/useCase/test_use_case.dart';

import '../../featchers/test/presentation/functions/test_functions.dart';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:gdn_health/core/flavor/app_flavor.dart';
import 'package:gdn_health/core/network/app_network.dart';
import 'package:gdn_health/featchers/product/domain/useCase/product_use_case.dart';
import 'package:gdn_health/featchers/product/presentation/functions/product_functions.dart';
import 'package:get_it/get_it.dart';

import '../../featchers/product/data/remoteDataSource/product_data_source.dart';
import '../../featchers/product/data/respository/product_repository_impl.dart';
import '../../featchers/product/domain/repository/product_repository.dart';
import '../../featchers/splash/functions/splash_screen_functions.dart';

GetIt sl = GetIt.instance;

Future intiGetIt() async {
  sl.registerSingleton<FlavorConfig>(FlavorConfig());
  sl.registerSingleton(SplashScreenFunctions());

  //network

  if (sl<FlavorConfig>().flavor == null) {
    sl.registerSingleton<AppNetworkInfo>(MockConnectivity());
  } else {
    sl.registerSingleton<AppNetworkInfo>(NetworkInfoImpl(Connectivity()));
  }

  //functions
  sl.registerLazySingleton(() => ProductFunctions());

  //data source
  sl.registerLazySingleton<ProductRemoteDataSource>(
      () => ProductRemoteDataSourceImpl());

  //repository
  sl.registerLazySingleton<ProductRepository>(
      () => ProductRepositoryImpl(productRemoteDataSource: sl()));

  //usecase
  sl.registerLazySingleton<ProductUseCase>(
      () => ProductUseCase(producteRepository: sl()));

//FK

//function
  sl.registerLazySingleton(() => TestFunctions());
//DataSource
  sl.registerLazySingleton<TestRemoteDataSource>(
      () => TestRemoteDataSourceImpl());
//repository
  sl.registerLazySingleton<TestRepository>(
      () => TestRepositoryImpl(testRemoteDataSource: sl()));
//usecase
  sl.registerLazySingleton<TestUseCase>(() => TestUseCase(eRepository: sl()));

//function
  sl.registerLazySingleton(() => WelcomeFunctions());
//DataSource
  sl.registerLazySingleton<WelcomeRemoteDataSource>(
      () => WelcomeRemoteDataSourceImpl());
//repository
  sl.registerLazySingleton<WelcomeRepository>(
      () => WelcomeRepositoryImpl(welcomeRemoteDataSource: sl()));
//usecase
  sl.registerLazySingleton<WelcomeUseCase>(
      () => WelcomeUseCase(eRepository: sl()));

//function
  sl.registerLazySingleton(() => AktakicuFunctions());
//DataSource
  sl.registerLazySingleton<AktakicuRemoteDataSource>(
      () => AktakicuRemoteDataSourceImpl());
//repository
  sl.registerLazySingleton<AktakicuRepository>(
      () => AktakicuRepositoryImpl(aktakicuRemoteDataSource: sl()));
//usecase
  sl.registerLazySingleton<AktakicuUseCase>(
      () => AktakicuUseCase(eRepository: sl()));
}










