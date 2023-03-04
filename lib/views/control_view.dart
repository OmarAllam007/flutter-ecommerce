import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopapp/core/view_model/auth_view_model.dart';
import 'package:shopapp/views/auth/login_screen.dart';

import '../core/view_model/control_view_model.dart';
import 'home_view.dart';

class ControlView extends GetWidget<AuthViewModel> {
  const ControlView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return (Get.find<AuthViewModel>().user == null)
          ? LoginScreen()
          : GetBuilder<ControlViewModel>(
              init: ControlViewModel(),
              builder: (controller) => Scaffold(
                body: controller.currentScreen,
                bottomNavigationBar: _buildBottomNavBar(),
              ),
            );
    });
  }

  Widget _buildBottomNavBar() {
    return GetBuilder<ControlViewModel>(
      init: Get.find<ControlViewModel>(),
      builder: (controller) => BottomNavigationBar(
        elevation: 0,
        selectedItemColor: Colors.black,
        backgroundColor: Colors.grey.shade50,
        items: [
          BottomNavigationBarItem(
            activeIcon: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Text(
                "Explore",
              ),
            ),
            label: "",
            icon: Padding(
              padding: const EdgeInsets.only(top: 25.0),
              child: Image.asset(
                'assets/images/explore.png',
                fit: BoxFit.contain,
                width: 20,
              ),
            ),
          ),
          BottomNavigationBarItem(
            activeIcon: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Text("Cart"),
            ),
            label: "",
            icon: Padding(
              padding: const EdgeInsets.only(top: 25.0),
              child: Image.asset(
                'assets/images/cart.png',
                fit: BoxFit.contain,
                width: 20,
              ),
            ),
          ),
          BottomNavigationBarItem(
            activeIcon: Padding(
              padding: const EdgeInsets.only(top: 25.0),
              child: Text("User"),
            ),
            label: "",
            icon: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Image.asset(
                'assets/images/user.png',
                fit: BoxFit.contain,
                width: 20,
              ),
            ),
          ),
        ],
        onTap: (index) => controller.changeSelectedValue(index),
        currentIndex: controller.navigationValue,
      ),
    );
  }
}
