import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopapp/core/view_model/auth_view_model.dart';
import 'package:shopapp/views/auth/login_screen.dart';

import '../../constants.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text.dart';
import '../widgets/custom_text_form_field.dart';

class RegisterScreen extends GetWidget<AuthViewModel> {
  RegisterScreen({Key? key}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: (){
            Get.off(LoginScreen());
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.only(top: 50, right: 20, left: 20),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                CustomText(text: "Sign up", fontSize: 30),
                SizedBox(
                  height: 30,
                ),
                CustomFormField(
                  text: "Name",
                  hintText: "Username",
                  onSave: (text) {
                    if (text != null && text.isNotEmpty) {
                      controller.name = text;
                    }
                  },
                  validator: (text) {
                    return null;
                  },
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
                CustomButton(
                    text: "SIGN Up",
                    onPressed: () {
                      _formKey.currentState?.save();
                      if (_formKey.currentState!.validate()) {
                        controller.createAccountWithEmailAndPassword();
                      }
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
