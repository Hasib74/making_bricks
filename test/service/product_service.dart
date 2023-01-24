import 'dart:convert';
import 'package:http/http.dart' as http;

import '../domain/model/product/product_model.dart';



class ProductService {
  String? url;

  ProductService({this.url});

  Future<ProductModel> getProduct(http.Client client) async {
    final response = await http.get(Uri.parse(url!));

    print("The product list res :" + response.body);

    await Future.delayed(Duration(seconds: 2));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.

    //  throw Exception('Failed to load album');
      return ProductModel.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}
