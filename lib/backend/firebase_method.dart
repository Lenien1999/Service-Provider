import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:serviceprovder/component/utilitiy.dart';

import '../firebaseController/firbaseAuth/auth_model.dart';

class FirebaseMethod {
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');
  Future<void> addUserData(UserModel user) async {
    await userCollection.doc(user.id).set(user.toJson());
  }

  Future<UserModel?> getUserData(String userId) async {
    try {
      var snapshot = await userCollection.doc(userId).get();
      if (snapshot.exists) {
        return UserModel.fromJson(snapshot.data() as Map<String, dynamic>);
      } else {
        return null;
      }
    } catch (e) {
      Utils().onError(e.toString());
      return null;
    }
  }
}
