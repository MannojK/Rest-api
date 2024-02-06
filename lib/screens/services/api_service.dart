import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../Gpt_api/models/data_model.dart';

class ApiService {
  final String baseUrl = 'https://jsonplaceholder.typicode.com/posts'; // jsonplaceholder posts api 
  final http.Client httpClient = http.Client();

  Future<List<DataModel>> fetchData() async {
    final url = Uri.parse(baseUrl);

    try {
      final response = await httpClient.get(url);
      if (response.statusCode == 200) {
        final  responseData = json.decode(response.body);
        return responseData.map((json) => DataModel.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load data');
      // return  CircularProgressIndicator();
      }
    } catch (error) {
      throw Exception('Network error: $error');
    }
  }
}
