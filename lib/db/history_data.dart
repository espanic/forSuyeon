class HistoryData {
  final int id;
  final String content;

  // Image? image;

  HistoryData(this.id, this.content);

  Map<String, dynamic> toMap() => {
        "id": id,
        "content": content,
      };
}
