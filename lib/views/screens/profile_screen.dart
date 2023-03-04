import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopapp/core/view_model/profile_view_model.dart';
import 'package:shopapp/views/auth/login_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileViewModel>(
      init: ProfileViewModel(),
      builder:(controller)=> Scaffold(
        body: Container(
          child:
              Center(child: TextButton(onPressed: () {
                controller.signout();
                Get.offAll(LoginScreen());
              }, child: Text("Signout"))),
        ),
      ),
    );
  }
}
