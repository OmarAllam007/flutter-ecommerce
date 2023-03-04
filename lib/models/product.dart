import 'dart:ui';

import 'package:shopapp/helper/extensions.dart';

class Product {
  String? name, image, description,  size, price,productId;
  Color? color;

  Product({
    this.name,
    this.image,
    this.description,
    this.color,
    this.size,
    this.price,
    this.productId,
  });

  Product.fromJson(Map<dynamic, dynamic> map) {
    if (map.isEmpty) {
      return;
    }

    name = map["name"];
    image = map["image"];
    description = map["description"];
    color = HexColor.fromHex(map["color"]);
    size = map["size"];
    price = map["price"];
    productId = map["productId"];
  }

  toJson() {
    return {
      'name': name,
      'image': image,
      'description': description,
      'color': color,
      'size': size,
      'price': price,
      'productId': productId,
    };
  }
}
