import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:prof_rest_api/Gpt_3/gpt.model.dart';
import 'package:prof_rest_api/Gpt_3/gpt_service.dart';
import 'package:prof_rest_api/Practice/servicesp.dart';

class homep extends StatefulWidget {
  
  homep({super.key});

  @override
  State<homep> createState() => _homepState();
}

class _homepState extends State<homep> {
    late Future<DataModel> futureData;

   @override
  void initState() {
    super.initState();
    futureData = ApiService.fetchDataFromApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('API Data Example'),
      ),
      body: FutureBuilder<DataModel>(
          future: ApiClass.fetchUsers(),
          builder: ((context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
   return Center(child:Text('Error: ${snapshot.error}'));
            } else if (snapshot.hasData) {
              final List <User> users = snapshot.data!.results;
              return ListView.builder(
                itemBuilder: (context, index) {
final user = users[index];
                return ListTile(
                  title: Text(
                    user.name.first,
                    style: TextStyle(fontSize: 20),
                  ),
                  subtitle: Text('Age : ${user.dob.age}'),
                );
              });
            } else {
              return Text('We have a problem Sergent ');
            }
          })),
    );
  }
}
