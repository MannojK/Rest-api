import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:prof_rest_api/Task/task_model..dart';

class ApiService {
  static const baseUrl = 'https://jsonplaceholder.typicode.com/todos';

  static Future<List<Task>> fetchTasks() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos'));


    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body) as List<dynamic>;
      return jsonData.map((taskJson) => Task.fromJson(taskJson)).toList();
    } else {
      throw Exception('Failed to load tasks');
    }
  }

  static Future<Task> createTask(Task task) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(task.toJson()),
    );

    if (response.statusCode == 201) {
      return Task.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to create task');
    }
  }

  static Future<Task> updateTask(Task task) async {
    final response = await http.put(
      Uri.parse('$baseUrl/${task.id}'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(task.toJson()),
    );

    if (response.statusCode == 200) {
      return Task.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to update task');
    }
  }

  static Future<void> deleteTask(int taskId) async {
    final response = await http.delete(Uri.parse('$baseUrl/$taskId'));

    if (response.statusCode != 204) {
      throw Exception('Failed to delete task');
    }
  }
}
