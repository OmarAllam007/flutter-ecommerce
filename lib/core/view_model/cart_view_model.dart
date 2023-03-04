import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shopapp/core/services/database/cart_database_helper.dart';
import 'package:shopapp/models/cart_product_model.dart';

class CartViewModel extends GetxController {
  ValueNotifier<bool> get loading => _loading;
  ValueNotifier<bool> _loading = ValueNotifier(false);

  List<CartProductModel> _cartProducts = [];

  double _totalPrice = 0.0;
  var db = CartDatabaseHelper.db;

  double get totalPrice => _totalPrice;

  List<CartProductModel> get cartProducts => _cartProducts;

  CartViewModel() {
    getAllProducts();
  }

  addProductToCart(CartProductModel cartProductModel) async {
    for (int i = 0; i < _cartProducts.length; i++) {
      if (_cartProducts[i].productId == cartProductModel.productId) {
        return;
      }
    }

    await db.insert(cartProductModel);
    _cartProducts.add(cartProductModel);
    _totalPrice += (double.parse(cartProductModel.price ?? '0') *
        cartProductModel.quantity);
    update();
  }

  getAllProducts() async {
    _loading.value = true;
    _cartProducts = await db.getAllProducts();
    _loading.value = false;
    getTotalPrice();
    update();
  }

  getTotalPrice() {
    for (int i = 0; i < _cartProducts.length; i++) {
      _totalPrice += (double.parse(_cartProducts[i].price ?? '0') *
          _cartProducts[i].quantity);
      update();
    }
  }

  increaseQuantity(int productIndex) async {
    _cartProducts[productIndex].quantity++;
    _totalPrice += (double.parse(_cartProducts[productIndex].price ?? '0'));
   await db.update(_cartProducts[productIndex]);
    update();
  }

  decreaseQuantity(int productIndex) async{
    if(_cartProducts[productIndex].quantity == 1){
      return;
    }
    _cartProducts[productIndex].quantity--;
    _totalPrice -= double.parse(_cartProducts[productIndex].price ?? '0');
    await db.update(_cartProducts[productIndex]);
    update();
  }
}
