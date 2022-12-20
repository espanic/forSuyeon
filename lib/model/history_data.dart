import 'package:cloud_firestore/cloud_firestore.dart';

class HistoryData {
  final Timestamp date;
  final String content;
  final String imageUrl;
  final String id;
  final String userID;

  HistoryData(this.date, this.content, this.id, this.userID,
      [this.imageUrl = ""]);

  HistoryData.fromJson(Map data)
      : date = data['date'],
        content = data['content'],
        imageUrl = data['imageUrl'],
        id = data['id'],
        userID = data['userID'];

  toJson() => {
        "date": date,
        "content": content,
        "imageUrl": imageUrl,
      };
}
