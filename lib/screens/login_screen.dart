import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive_tut_2/boxes.dart';
import 'package:hive_tut_2/model/todo.dart';

class LoginScreesn extends StatefulWidget {
  const LoginScreesn({Key? key}) : super(key: key);

  @override
  State<LoginScreesn> createState() => _LoginScreesnState();
}

class _LoginScreesnState extends State<LoginScreesn> {
  var formKey = GlobalKey<FormState>();
  late String name;
  late String email;
  late String pass;
  @override
  Widget build(BuildContext context) {

    validated() {
      if (formKey.currentState != null && formKey.currentState!.validate()) {
        _onFormSubmit();
        print("Form Validated");
      } else {
        print("Form Not Validated");
        return;
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Column(
        children: [
          Form(
            key: formKey,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    autofocus: true,
                    initialValue: '',
                    decoration: InputDecoration(labelText: 'name'),
                    onChanged: (value) {
                      setState(() {
                        name = value ;
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.trim().length == 0) {
                        return "required";
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    initialValue: '',
                    decoration: const InputDecoration(
                      labelText: 'password',
                    ),
                    onChanged: (value) {
                      setState(() {
                        pass = value;
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.trim().length == 0) {
                        return "required";
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    initialValue: '',
                    decoration: const InputDecoration(
                      labelText: 'email',
                    ),
                    onChanged: (value) {
                      setState(() {
                        email = value;
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.trim().length == 0) {
                        return "required";
                      }
                      return null;
                    },
                  ),
                  ElevatedButton(
                    onPressed: () {
                      validated();
                    },
                    child: Text('Add Todo'),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  void _onFormSubmit() {
    Box<Register> contactsBox = Hive.box<Register>(HiveBoxes.login);
    contactsBox.add(Register(email: email, pass: pass, name: name));
    print(contactsBox.values.toString());
    // Box<Todo> contactsBox = Hive.box<Register>(HiveBoxes.);
    // contactsBox.add(Register(email: email, pass: pass, name: name));
  }

}
