// ignore_for_file: camel_case_types

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:prof_rest_api/P/p_model.dart';

class p_service{
  Future<List> fetchUsers () async{
   final response =  await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
   if (response.statusCode == 200) {
  //   final List<dynamic> data = jsonDecode(response.body);
  //  return  data.map((e) => p_DataModel.fromJson(e)).toList();
  final data = jsonDecode(response.body);
     return data as List<dynamic>;
   } else {
     throw Exception('There is an error ');
   }
  }
}