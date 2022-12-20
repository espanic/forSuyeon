import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:for_suyeon/domain/provider/history_data_provider.dart';
import 'package:for_suyeon/model/history_data.dart';

class HistoryDataRepository {
  final _provider = HistoryDataProvider();

  Stream<List<HistoryData>> streamData() {
    var stream = _provider.streamData();
    return stream.map(
      (event) => List.generate(
        event.docs.length,
        (index) {
          var doc = event.docs[index];
          var data = doc.data();
          data['id'] = doc.id;
          return HistoryData.fromJson(data);
        },
      ),
    );
  }

  Future<void> createData(
      String content, DateTime dateTime, File imageFile) async {
    Map<String, dynamic> data = {
      "content": content,
      "date": Timestamp.fromDate(dateTime),
    };
    await _provider.createData(data, imageFile);
  }

  Future<void> updateData(
      String content, String id,String imageUrl, File? imageFile) async {
    Map<String, dynamic> data = {
      "content": content,
      "imageUrl" : imageUrl,
    };
    await _provider.updateData(data, id, imageFile);
  }

  Future<void> deleteData(String id, String imageUrl) async {
    await _provider.deleteData(id, imageUrl);
  }
}
