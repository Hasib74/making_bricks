import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:mockito/mockito.dart';

abstract class AppNetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfoImpl implements AppNetworkInfo {
  final Connectivity connectionChecker;

  NetworkInfoImpl(this.connectionChecker);

  @override
  Future<bool> get isConnected =>
      connectionChecker.checkConnectivity().then((value) {
        print("Current connectivity : ${value.toString()}");
        return value == ConnectivityResult.mobile ||
                value == ConnectivityResult.wifi ||
                value == ConnectivityResult.ethernet
            ? true
            : false;
      });
}

class MockConnectivity extends Mock implements AppNetworkInfo {
  @override
  Future<bool> get isConnected => Future.value(true);
}
