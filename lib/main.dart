import 'package:flutter/material.dart';
import 'package:prof_rest_api/BaseClient/homepage.dart';
import 'package:prof_rest_api/Correct/Chome.dart';
import 'package:prof_rest_api/Gpt_2/home.dart';
import 'package:prof_rest_api/Gpt_api/models/home_screen.dart';
import 'package:prof_rest_api/P/p_home.dart';
import 'package:prof_rest_api/Practice/homep.dart';
import 'package:prof_rest_api/Task/task_list.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
      textTheme:     const  TextTheme(
      // displayLarge: TextStyle(color: Colors.white),
      // displayMedium: TextStyle(color: Colors.white),
      // bodyMedium: TextStyle(color: Colors.white),
      // titleMedium: TextStyle(color: Colors.blue),
      // bodySmall: TextStyle(color: Colors.white),
    ),
      colorScheme: ColorScheme.fromSwatch(accentColor: Colors.white),
        primarySwatch: Colors.blue,
      ),
home: 

HomePage(),
    );
  }
}

