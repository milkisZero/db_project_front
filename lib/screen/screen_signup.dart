import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SignupFormData {
  String? id;
  String? pwd;
  int? upoint;
  String? uname;
  String? email;

  SignupFormData({this.id, this.pwd, this.upoint, this.uname, this.email});

  Map<String, dynamic> toJson() =>
      {"id": id, "pwd": pwd, "upoint": 10000, "uname": uname, "email": email};
}

class SignupForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SignupForm();
}

class _SignupForm extends State<SignupForm> {
  final formKey = GlobalKey<FormState>();
  SignupFormData formData = SignupFormData();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;

    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.all(30),
          padding: EdgeInsets.all(10),
          child: Form(
            key: this.formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  key: ValueKey(1),
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.account_circle_outlined),
                      labelText: 'id'),
                  onChanged: (value) {
                    formData.id = value;
                  },
                ),
                TextFormField(
                  key: ValueKey(2),
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.lock_open_outlined),
                      labelText: 'password'),
                  onChanged: (value) {
                    formData.pwd = value;
                  },
                ),
                TextFormField(
                  key: ValueKey(3),
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.lock_open_outlined),
                      labelText: 'name'),
                  onChanged: (value) {
                    formData.uname = value;
                  },
                ),
                TextFormField(
                  key: ValueKey(4),
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.mail_outline), labelText: 'Email'),
                  onChanged: (value) {
                    formData.email = value;
                  },
                ),
                Padding(padding: EdgeInsets.only(bottom: width * 0.024)),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    side: BorderSide(color: Colors.black, width: 2),
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    fixedSize: Size(width * 0.2, width * 0.1),
                  ),
                  child: const Text(
                    'SignUp',
                    style: TextStyle(color: Colors.black),
                  ),
                  onPressed: () {
                    addTaskToServer();
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    ));
  }

  void _showDialog(String message) {
    showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(message),
        actions: [
          TextButton(
            child: const Text('OK'),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }

  void addTaskToServer() async {
    String jsonResult = jsonEncode(formData.toJson());
    final result = await http.post(
      Uri.http('13.209.70.215:8000', 'quiz/make/ui/'),
      headers: {'content-type': 'application/json'},
      body: jsonResult,
    );
    if (result.statusCode == 201) {
      _showDialog('Successfully signed up');
    } else {
      _showDialog('Failed to sign up');
    }
  }
}
