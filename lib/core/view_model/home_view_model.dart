import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shopapp/core/services/home_service.dart';
import 'package:shopapp/models/product.dart';

import '../../models/category.dart';

class HomeViewModel extends GetxController {
  final ValueNotifier<bool> _loading = ValueNotifier(false);
  ValueNotifier<bool> get loading => _loading;


  final List<Category> _categories = [];
  final List<Product> _products = [];

  List<Category> get categoriesList => _categories;
  List<Product> get productList => _products;

  HomeViewModel() {
    getCategories();
    getBestSellingProducts();
  }

  getCategories() async {
    _loading.value = true;
    HomeService().getCategories().then((docs) {
      for (var i = 0; i < docs.length; i++) {
        _categories.add(Category.fromJson(docs[i].data() as Map<dynamic,dynamic>));
      }
      update();
      _loading.value = false;
    });
  }

  getBestSellingProducts() async {
    loading.value = true;

    HomeService().getBestSelling().then((docs) {
      for (int i = 0; i < docs.length; i++) {
        _products.add(Product.fromJson(docs[i].data() as Map<dynamic,dynamic>));
      }

      update();
      _loading.value = false;
    });

  }
}
