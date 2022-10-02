import 'dart:typed_data';

import 'package:flutter/widgets.dart';

class HistoryData {
  final int id;
  final String content;
  // Image? image;

  HistoryData(this.id, this.content);

  Map<String, dynamic> toMap() => {
        "id": id,
        "content": content,
      };
  // void imageArray2Image() {
  //   assert (imageArray != null);
  //   image = Image.memory(imageArray!);
  //   assert (image != null);
  //   imageArray = null;
  // }
}

