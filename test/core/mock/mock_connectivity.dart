import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:gdn_health/core/network/app_network.dart';
import 'package:mockito/mockito.dart';

class MockConnectivity extends Mock implements AppNetworkInfo {
  @override
  Future<bool> get isConnected => Future.value(true);
}
