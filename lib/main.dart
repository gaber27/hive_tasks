import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_tut_2/boxes.dart';
import 'package:hive_tut_2/model/todo.dart';
import 'package:hive_tut_2/screens/list_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'screens/login_screen.dart';

void main() async {
  await Hive.initFlutter();

  Hive.registerAdapter(TodoAdapter());
  Hive.registerAdapter(RegisterAdapter());
  await Hive.openBox<Todo>(HiveBoxes.todo);
  await Hive.openBox<Register>(HiveBoxes.login);
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: LoginScreesn()
      // MyHomePage(title: 'Todo Hive Example'),
    );
  }
}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.deepPurple, scaffoldBackgroundColor: Colors.grey[400]),
      home: MyHomePage(
        title: 'Todo list',
      ),

    );
  }

