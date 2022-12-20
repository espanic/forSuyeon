import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:for_suyeon/domain/provider/mixin/firebase_storage_mixin.dart';
import 'package:for_suyeon/domain/provider/mixin/firestore_mixin.dart';
import 'package:path/path.dart';

class HistoryDataProvider with FireStoreMixin, FirebaseStorageMixin {
  Stream<QuerySnapshot<Map<String, dynamic>>> streamData() {
    return fireStore
        .collection('history')
        .orderBy('date', descending: true)
        .snapshots();
  }

  Future<void> createData(Map<String, dynamic> data, File imageFile) async {
    var snapshot = await fireStorage
        .ref("/history_pictures/${basename(imageFile.path)}")
        .putFile(imageFile);
    String imageUrl = await snapshot.ref.getDownloadURL();
    data['imageUrl'] = imageUrl;
    await fireStore.collection('history').add(data);
  }

  Future<void> updateData(
      Map<String, dynamic> data, String docId, File? imageFile) async {
    if (imageFile != null) {
      var ref = fireStorage.refFromURL(data['imageUrl']);
      await ref.delete();
      var snapshot = await fireStorage
          .ref("/history_pictures/${basename(imageFile.path)}")
          .putFile(imageFile);
      String imageUrl = await snapshot.ref.getDownloadURL();
      data['imageUrl'] = imageUrl;
    }
    await fireStore.collection('history').doc(docId).update(data);
  }

  Future<void> deleteData(String id, String imageUrl) async {
    await fireStore.collection('history').doc(id).delete();
    await fireStorage.refFromURL(imageUrl).delete();
  }
}
