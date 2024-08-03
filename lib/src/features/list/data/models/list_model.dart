class ListModel {
  final int? userId;
  final int? id;
  final String? title;
  final String? body;

  ListModel({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  factory ListModel.fromJson(Map<String, dynamic> json) => ListModel(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
      };
}
