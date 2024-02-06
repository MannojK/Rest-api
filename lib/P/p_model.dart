// ignore: camel_case_types
class p_DataModel {
  final int id;
  final String title;
  final String body;
  final int userId;


  p_DataModel({
    required this.id,
    required this.title,
    required this.body,
    required this.userId,
  });

  factory p_DataModel.fromJson(Map<String, dynamic> json) {
    return p_DataModel(
      id: json['id'],
      title: json['title'], body: json['body'],
      userId: json['userId'],

    );
  }
}
