import 'package:flutter/material.dart';
import 'package:prof_rest_api/Correct/Cmodel.dart';
import 'package:prof_rest_api/Correct/Cservice.dart';



class CHome  extends StatelessWidget {
  final ApiService apiService = ApiService();

CHome ({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Professional REST API Example'),
      ),
      body: Center(
        child: FutureBuilder<List<CModel>>(
          future: apiService.fetchUsers(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (snapshot.hasData) {
              final users = snapshot.data!;
              return ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  final user = users[index];
                  return ListTile(
                    title: Text(users[index].name),
                    subtitle: Text(user.email),
                  );
                },
              );
            } else {
              return Text('No data available');
            }
          },
        ),
      ),
    );
  }
}
