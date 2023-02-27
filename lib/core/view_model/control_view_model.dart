import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopapp/views/home_view.dart';
import 'package:shopapp/views/screens/cart_screen.dart';
import 'package:shopapp/views/screens/profile_screen.dart';

class ControlViewModel extends GetxController {
  int _navigationValue = 0;
  Widget _currentScreen = HomeView();

  get navigationValue => _navigationValue;
  get currentScreen => _currentScreen;

  void changeSelectedValue(int selectedValue){
    _navigationValue = selectedValue;

    switch(selectedValue){
      case 0:
        _currentScreen = HomeView();
        break;
      case 1:
        _currentScreen = CartScreen();
        break;
      case 2:
        _currentScreen = ProfileScreen();
        break;
    }

    update();
  }
}