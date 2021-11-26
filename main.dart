// ignore_for_file: unnecessary_new
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(const MyApp());

String username = '';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter App with MYSQL',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController name = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController mobile = new TextEditingController();

  Future<http.Response> sendData() {
    return http.post(
        Uri.parse(
            'http://192.168.1.232/DemoConeccionBDS/Servidor/insertdata.php'),
        body: {
          'name': name.text,
          'email': email.text,
          'mobile': mobile.text,
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register"),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            const Text(
              "Username",
              style: TextStyle(fontSize: 18.0),
            ),
            TextField(
              controller: name,
              decoration: const InputDecoration(hintText: 'name'),
            ),
            const Text(
              "Email",
              style: TextStyle(fontSize: 18.0),
            ),
            TextField(
              controller: email,
              decoration: const InputDecoration(hintText: 'Email'),
            ),
            const Text(
              "Mobile",
              style: TextStyle(fontSize: 18.0),
            ),
            TextField(
              controller: mobile,
              decoration: const InputDecoration(hintText: 'Mobile'),
            ),
            ElevatedButton(
              child: const Text("Register"),
              onPressed: () {
                sendData();
              },
            ),
          ],
        ),
      ),
    );
  }
}
