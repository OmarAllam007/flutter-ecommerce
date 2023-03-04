import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shopapp/models/user.dart';

class FireStoreUser {
  final _collectionRef = FirebaseFirestore.instance.collection('Users');

  Future<void> addUserToDB(UserModel userModel) async {
    return await _collectionRef.doc(userModel.userId).set(userModel.toJson());
  }

  Future<DocumentSnapshot> getCurrentUser(String uid) async{
    return await _collectionRef.doc(uid).get();
  }
}
