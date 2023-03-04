import 'dart:ui';

import 'package:shopapp/helper/extensions.dart';

class CartProductModel {
  String? name, image, price, productId;
  int quantity = 0;

  CartProductModel(
      {this.name, this.image, this.price, this.quantity = 0, this.productId});

  CartProductModel.fromJson(Map<dynamic, dynamic> map) {
    if (map.isEmpty) {
      return;
    }

    name = map["name"];
    image = map["image"];
    price = map["price"];
    quantity = map["quantity"] ?? 0;
    productId = map["productId"] ?? '';
  }

  toJson() {
    return {
      'name': name,
      'image': image,
      'price': price,
      'quantity': quantity,
      'productId': productId
    };
  }
}
