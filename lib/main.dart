import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_tut_2/boxes.dart';
import 'package:hive_tut_2/model/todo.dart';
import 'package:hive_tut_2/screens/list_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(TodoAdapter());
  await Hive.openBox<Todo>(HiveBoxes.todo);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  static final String title = 'Hive To Do';

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
}
