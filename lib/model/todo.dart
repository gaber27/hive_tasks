import 'package:hive/hive.dart';
part 'todo.g.dart';

@HiveType(typeId: 0)
class Todo extends HiveObject {
  @HiveField(0)
  String? id;

  @HiveField(1)
  String title;

  @HiveField(2)
  String description;

  Todo({required this.title, required this.description});
}

@HiveType(typeId: 1)
class Register extends HiveObject {
  @HiveField(0)
  String? id;

  @HiveField(1)
  String email;

  @HiveField(2)
  String pass;

  @HiveField(3)
  String name;

  Register({required this.email, required this.pass,required this.name});
}

