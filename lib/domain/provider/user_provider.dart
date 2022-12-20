import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:for_suyeon/domain/provider/mixin/firebase_auth_mixin.dart';
import 'package:for_suyeon/domain/provider/mixin/firebase_storage_mixin.dart';
import 'package:for_suyeon/domain/provider/mixin/firestore_mixin.dart';

class UserProvider
    with FireBaseAuthMixin, FireStoreMixin, FirebaseStorageMixin {
  Future<DocumentSnapshot<Map<String, dynamic>>> login(
      String email, String password) async {
    var userCredential = await firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    var docRef =
        await fireStore.collection('user').doc(userCredential.user!.uid).get();
    return docRef;
  }

  Future<void> logout() async {
    await firebaseAuth.signOut();
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> getData(String uid) async {
    return await fireStore.collection('user').doc(uid).get();
  }

  Future<Map<String, dynamic>> saveProfile(Map<String , dynamic> data, String uid, File imageFile) async{
    var ref =  fireStorage.ref('/user_data/$uid/avatar');
    var snapshot = await ref.putFile(imageFile);
    String avatarUrl = await snapshot.ref.getDownloadURL();
    data['avatarUrl'] = avatarUrl;
    await fireStore.collection('user').doc(uid).update(data);
    return data;
  }


}
