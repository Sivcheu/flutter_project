// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

ProductModel productModelFromJson(String str) =>
    ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  ProductModel({
    this.products,
  });

  List<Product> products;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        products: List<Product>.from(
            json["products"].map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
      };
}

class Product {
  Product({
    this.pId = "No",
    this.name = "No",
    this.price = "No",
    this.processor = "No",
    this.ram = "No",
    this.storage = "No",
    this.screen = "No",
    this.vga = "No",
    this.weight = "No",
    this.color = "No",
    this.brandName = "No",
    this.img = "No",
    this.date,
  });

  String pId;
  String name;
  String price;
  dynamic processor;
  dynamic ram;
  dynamic storage;
  dynamic screen;
  dynamic vga;
  dynamic weight;
  dynamic color;
  dynamic brandName;
  dynamic img;
  DateTime date;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        pId: json["p_id"],
        name: json["name"],
        price: json["price"],
        processor: json["processor"],
        ram: json["ram"],
        storage: json["storage"],
        screen: json["screen"],
        vga: json["vga"],
        weight: json["weight"],
        color: json["color"],
        brandName: json["brand_name"],
        img: json["img"],
        date: DateTime.parse(json["date"]),
      );

  Map<String, dynamic> toJson() => {
        "p_id": pId,
        "name": name,
        "price": price,
        "processor": processor,
        "ram": ram,
        "storage": storage,
        "screen": screen,
        "vga": vga,
        "weight": weight,
        "color": color,
        "brand_name": brandName,
        "img": img,
        "date": date.toIso8601String(),
      };
}
