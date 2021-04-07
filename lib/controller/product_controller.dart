import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:prefinal/models/product_model.dart';

Future<ProductModel> readProduct() async {
  String url = "http://10.0.2.2:80/final/product/readProduct.php";
  // String url = "http://192.168.43.173:80/api/localhost_api.php";
  http.Response response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    String body = response.body;
    return compute(productModelFromJson, body);
  } else {
    throw Exception("Error While loading");
  }
}

Future<String> insertProduct(Product product) async {
  String url = "http://10.0.2.2:80/final/product/insert.php";
  // String url = "http://192.168.43.173:80/api/insert.php";

  http.Response response =
      await http.post(Uri.parse(url), body: product.toJson());
  if (response.statusCode == 200) {
    return response.body;
  } else {
    throw Exception("error ${response.statusCode}");
  }
}

Future<String> deleteProduct(Product product) async {
  String url = "http://10.0.2.2:80/final/product/delete.php";
  // String url = "http://192.168.43:80/api/update.php";

  http.Response response =
      await http.post(Uri.parse(url), body: product.toJson());
  if (response.statusCode == 200) {
    return response.body;
  } else {
    throw Exception("error ${response.statusCode}");
  }
}

Future<String> updateProduct(Product product) async {
  String url = "http://10.0.2.2:80/final/product/update.php";
  // String url = "http://192.168.43:80/api/update.php";

  http.Response response =
      await http.post(Uri.parse(url), body: product.toJson());
  if (response.statusCode == 200) {
    return response.body;
  } else {
    throw Exception("error ${response.statusCode}");
  }
}
