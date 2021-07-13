import 'package:flutter/material.dart';
import 'package:flutter_app_test/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Page',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: //risk_factor()
      loginPage(),
    );
  }
}
