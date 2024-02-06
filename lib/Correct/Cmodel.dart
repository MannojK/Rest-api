class CModel {
  final int id;
  final String name;
  final String email;

  CModel({required this.id, required this.name, required this.email});

  factory CModel.fromJson(Map<String, dynamic> json) {
    return CModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
    );
  }
}
