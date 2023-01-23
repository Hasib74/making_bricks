import 'package:bloc_test/bloc_test.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gdn_health/core/dependencyInjection/app_dependency_injections.dart';
import 'package:gdn_health/core/network/app_network.dart';
import 'package:gdn_health/featchers/product/presentation/bloc/product_cubit.dart';
import 'package:gdn_health/featchers/product/presentation/functions/product_functions.dart';
import 'package:mockito/mockito.dart';

import '../../core/appState/app_state.dart';
import '../../core/mock/mock_connectivity.dart';

class ProductBloc extends MockBloc<ProductCubit, ProductState>
    implements ProductCubit {}

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  await intiGetIt();
  sl.registerSingleton(AppState());
  sl<AppState>().appStateEnum = AppStateEnum.TESTING;

  // MockConnectivity mockConnectivity = MockConnectivity();

  ProductBloc bloc;
  group("Bloc test", () {
    // when(mockConnectivity.onConnectivityChanged).thenAnswer(
    //         (_) => Stream<ConnectivityResult>.fromIterable([ConnectivityResult.mobile, ConnectivityResult.wifi]));

    test("Check connectivity", () async {
      var _connectivity = await sl<MockConnectivity>().isConnected;

      print("The connectivity is : $_connectivity");

      expectLater(_connectivity, true);
    });

    setUp(() {
      bloc = ProductBloc();
    });

    blocTest<ProductCubit, ProductState>(
      "Load product data",
      build: () => ProductCubit(productUseCase: sl()),
      act: (bloc) => bloc.fetchProduct(),
      expect: () => [
        ProductLoading().runtimeType,
        ProductLoaded(productModel: sl<ProductFunctions>().productModel)
            .runtimeType,
      ],
      //   wait: Duration(seconds: 5),
    );

    //  expectLater(bloc!, matcher)

    // whenListen(ProductCubit()., Stream.fromIterable([ProductLoading()]));
  });
}
