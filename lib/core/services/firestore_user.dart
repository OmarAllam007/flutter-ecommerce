import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shopapp/models/user.dart';

class FireStoreUser {
  final collectionRef = FirebaseFirestore.instance.collection('Users');

  Future<void> addUserToDB(UserModel userModel) async {
    return await collectionRef.doc(userModel.userId).set(userModel.toJson());
  }
}
