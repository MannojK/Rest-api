import 'dart:convert';

import 'package:prof_rest_api/Correct/Cmodel.dart';
import 'package:http/http.dart' as http;


class ApiService {
  final String baseUrl = 'https://jsonplaceholder.typicode.com';

  // ApiService(String s);

  Future<List<CModel>> fetchUsers() async {
    final response = await http.get(Uri.parse('$baseUrl/users'));

    if (response.statusCode == 200) {
      final  List <dynamic>  userJsonList = json.decode(response.body);
      return userJsonList.map((json) => CModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to fetch data');
    }
  }
}
  // fetchDa