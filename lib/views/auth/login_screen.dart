import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopapp/constants.dart';
import 'package:shopapp/core/view_model/auth_view_model.dart';
import 'package:shopapp/views/auth/second_screen.dart';
import 'package:shopapp/views/widgets/custom_button.dart';
import 'package:shopapp/views/widgets/custom_social_button.dart';
import 'package:shopapp/views/widgets/custom_text.dart';
import 'package:shopapp/views/widgets/custom_text_form_field.dart';

import 'register_screen.dart';

class LoginScreen extends GetWidget<AuthViewModel> {
  LoginScreen({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.only(top: 50, right: 20, left: 20),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:  [
                    CustomText(text: "Welcome", fontSize: 30),
                    GestureDetector(
                      onTap: (){
                        Get.to(RegisterScreen());
                      },
                      child: CustomText(
                          text: "SignUp", color: primaryColor, fontSize: 18),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                const CustomText(
                  text: "sign in to continue",
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 30,
                ),
                CustomFormField(
                  text: "Email",
                  hintText: "omar@gmail.com",
                  onSave: (text) {
                    if (text != null && text.isNotEmpty) {
                      controller.email = text;
                    }
                  },
                  validator: (text) {
                    return null;
                  },
                ),
                SizedBox(
                  height: 40,
                ),
                CustomFormField(
                  text: "Password",
                  hintText: "***********",
                  onSave: (text) {
                    if (text != null && text.isNotEmpty) {
                      controller.password = text;
                    }
                  },
                  validator: (text) {
                    return null;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                CustomText(
                  text: "Forget Password?",
                  fontSize: 14,
                  alignment: Alignment.topRight,
                ),
                SizedBox(
                  height: 20,
                ),
                CustomButton(
                    text: "SIGN IN",
                    onPressed: () {
                      _formKey.currentState?.save();
                      if (_formKey.currentState!.validate()) {
                        controller.signInWithEmailAndPassword();
                      }

                    }),
                SizedBox(
                  height: 20,
                ),
                CustomText(
                  text: "----- OR -----",
                  alignment: Alignment.center,
                ),
                SizedBox(
                  height: 40,
                ),
                CustomSocialButton(
                  text: "Sign in with google",
                  imageName: "assets/images/google.png",
                  onPressed: () {
                    controller.googleSignIn();
                  },
                ),
                SizedBox(
                  height: 40,
                ),
                CustomSocialButton(
                  onPressed: () {
                    controller.facebookSignIn();
                  },
                  text: "Sign in with facebook",
                  imageName: "assets/images/facebook.png",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
