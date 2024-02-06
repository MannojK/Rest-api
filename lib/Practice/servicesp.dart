import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:prof_rest_api/Gpt_3/gpt.model.dart';

class ApiClass {
  static Future<DataModel> fetchUsers() async {
    final response =
        await http.get(Uri.parse("https://randomuser.me/api/?results=100"));
    if (response.statusCode == 200) {
     final Map<String,dynamic> data = jsonDecode(response.body);
     return DataModel.fromJson(data);
    } else {
      throw Exception('Error excpetion occurs ');
    }
  }
}
