import 'package:flutter/material.dart';
import 'package:prof_rest_api/Gpt_3/gpt.model.dart';
import 'package:prof_rest_api/Gpt_3/gpt_service.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<DataModel> futureData;
   final ApiService service = ApiService();

  @override
  void initState() {
    super.initState();
    futureData = ApiService.fetchDataFromApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Random Users'),
      ),
      body: FutureBuilder<DataModel>(
        future: ApiService.fetchDataFromApi() , // or you can futureData;
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final List<User> users = snapshot.data!.results;

            return ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                final user = users[index];

                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(user.picture.medium),
                  ),
                  title: Text('${user.name.title} ${user.name.last}'),
                  subtitle: Text('Age: ${user.dob.age}'),
                );
              },
            );
          } else {
            return Center(child: Text('No data available'));
          }
        },
      ),
    );
  }
}
