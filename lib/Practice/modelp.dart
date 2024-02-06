class DataModel {
  final int id;
  final String title;
  final String body;
  final int userId;


  DataModel({
    required this.id,
    required this.title,
    required this.body,
    required this.userId,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      id: json['id'],
      title: json['title'], body: json['body'],
      userId: json['userId'],

    );
  }
}
