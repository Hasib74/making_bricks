import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:gdn_health/core/remoteHelper/app_urls.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import '../../data/product_data_source.dart';
import '../../domain/model/product/model.dart';
import '../../domain/model/product/product_model.dart';
import '../../service/product_service.dart';
import 'product_test.mocks.dart';

class MockProduct extends Mock implements Product {}

@GenerateMocks(
  [http.Client],
)
main() async {
  MockProduct? mockProduct;

  setUp(() {
    mockProduct = new MockProduct();
  });
  group("product test", () {
    test("Fetch data from api ", () async {
      final client = MockClient();

      String? _productRes = await ProductDataSource().productData();

      print("The product res : " + jsonDecode(_productRes!).toString());

      when(client.get(
        Uri.parse(AppUri.products),
        headers: anyNamed('headers'), // Add this line
      )).thenAnswer((_) async => http.Response(_productRes, 200));

      //can null able or not
      ProductModel _product =
          await ProductService(url: AppUri.products).getProduct(client);

      expect(_product.products![0].title, "iPhone 9");
    });

    // test('throws an exception if the http call completes with an error', () {
    //   final client = MockClient();
    //
    //   // Use Mockito to return an unsuccessful response when it calls the
    //   // provided http.Client.
    //   when(client.get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1')))
    //       .thenAnswer((_) async => http.Response('Not Found', 404));
    //
    //   expect(ProductService().getProduct(client), throwsException);
    // });
  });
}
