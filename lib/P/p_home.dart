import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:prof_rest_api/P/p_model.dart';
import 'package:prof_rest_api/P/p_services.dart';

class p_home extends StatelessWidget {
  const p_home({super.key});

  @override
  Widget build(BuildContext context) {
    final p_service service = p_service();
    // List<p_DataModel> models = [];
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
          title: Text(
            'REST APi',
          ),
          centerTitle: true,
          backgroundColor: Colors.red),
      body: Center(
        child: FutureBuilder<List>(
            future: service.fetchUsers(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.hasError || !snapshot.hasData) {
                final users = snapshot.data!;

                return Center(child: Text('No Data'));
              } else {
                final users = snapshot.data!;

                return ListView.builder(
                    itemCount: users.length,
                    itemBuilder: (context, index) {
                      final user = p_DataModel.fromJson(users[index]);

                      return Column(
                        children: [
                          ListTile(
                            title: Text(
                              user.title,
                              style: TextStyle(fontSize: 18),
                            ),
                            subtitle: Text(user.body),
                          ),
                          Divider(
                              color: Colors.grey[700],
                              endIndent: 10,
                              indent: 10,
                              height: 9,
                              thickness: 1),
                        ],
                      );
                    });
              }
            }),
      ),
    );
  }
}
