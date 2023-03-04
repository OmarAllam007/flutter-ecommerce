import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shopapp/helper/local_storage_data.dart';

class ProfileViewModel extends GetxController{
  final LocalStorageData localStorageData = Get.find();

  Future<void> signout() async {
    await GoogleSignIn().signOut();
    await FirebaseAuth.instance.signOut();
    await localStorageData.deleteUser();
  }
}