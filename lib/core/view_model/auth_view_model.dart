import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shopapp/core/services/firestore_user.dart';
import 'package:shopapp/models/user.dart';
import 'package:shopapp/views/home_view.dart';

class AuthViewModel extends GetxController {
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  FirebaseAuth _auth = FirebaseAuth.instance;
  FacebookLogin _facebookLogin = FacebookLogin();

  late String email = '', password = '', name = '';

  Rxn<User> _user = Rxn<User>();

  String? get user => _user.value?.email;

  @override
  void onInit() {
    super.onInit();
    _user.bindStream(_auth.authStateChanges());
  }

  @override
  void onClose() {
    super.onClose();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  void googleSignIn() async {
    final GoogleSignInAccount? account = await _googleSignIn.signIn();
    GoogleSignInAuthentication? authentication = await account!.authentication;

    final authCredential = GoogleAuthProvider.credential(
        idToken: authentication.idToken,
        accessToken: authentication.accessToken);
    await _auth.signInWithCredential(authCredential).then((user) async{
      await saveUserToFireStoreDb(user);
      Get.offAll(HomeView());
    });
  }

  void facebookSignIn() async {
    FacebookLoginResult result =
        await _facebookLogin.logIn(customPermissions: ['email']);

    final accessToken = result.accessToken?.token;

    if (accessToken != null && result.status == FacebookLoginStatus.success) {
      final credentials = FacebookAuthProvider.credential(accessToken);
      await _auth.signInWithCredential(credentials);
    }
  }

  void signInWithEmailAndPassword() async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      Get.offAll(() => HomeView());
    } catch (e) {
      Get.snackbar("Login Error", e.toString(),
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  void createAccountWithEmailAndPassword() async {
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((user) async {
        await saveUserToFireStoreDb(user);
      });
      Get.offAll(() => HomeView());
    } catch (e) {
      Get.snackbar("Register Error", e.toString(),
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  Future<void> saveUserToFireStoreDb(UserCredential user) async {
    UserModel userModel = UserModel(
      userId: user.user!.uid,
      name: name == '' ? user.user?.displayName : name,
      email: user.user?.email,
      imageUrl: user.user?.photoURL,
    );
    print(userModel);
    await FireStoreUser().addUserToDB(userModel);
  }
}
