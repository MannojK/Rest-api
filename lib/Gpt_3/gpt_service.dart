// api_service.dart

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:prof_rest_api/Gpt_3/gpt.model.dart';

class ApiService {
  static Future<DataModel> fetchDataFromApi() async {
    final response =
        await http.get(Uri.parse("https://randomuser.me/api/?results=100"));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      return DataModel.fromJson(data);
      //  List<dynamic> responsedata = jsonDecode(response.
      // );
      //  return responsedata.map((e) => DataModel.fromJson(e)).toList();
    } else {
      throw Exception('Failed to fetch data');
    }
  }
}
