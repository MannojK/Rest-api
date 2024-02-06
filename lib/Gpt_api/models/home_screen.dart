import 'package:flutter/material.dart';
import 'package:prof_rest_api/Gpt_api/models/data_model.dart';
import 'package:prof_rest_api/screens/services/api_service.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ApiService _apiService = ApiService();
  List<DataModel> _dataList = [];

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    try {
      final dataList = await _apiService.fetchData();
      setState(() {
        _dataList = dataList;
      });
    } catch (error) {
      // Handle error gracefully
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('API Data Example'),
      ),
      body: ListView.builder(
        itemCount: _dataList.length,
        itemBuilder: (context, index) {
          final dataItem = _dataList[index];
          return ListTile(
            title: Text(dataItem.title),
            subtitle: Text(dataItem.body),
          );
        },
      ),
    );
  }
}
