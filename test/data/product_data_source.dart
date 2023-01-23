import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProductDataSource {
  Future<String?> productData() async {
    WidgetsFlutterBinding.ensureInitialized();
    final String response =
        await rootBundle.loadString('assets/fake_data/products.json');

    print("Product response : " + response);
    return (response);
  }
}
