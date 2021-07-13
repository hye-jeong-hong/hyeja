import 'package:better_day_ing/risk_factor.dart';
import 'package:better_day_ing/screen_button.dart';
import 'package:flutter/material.dart';
import 'package:better_day_ing/survey_list.dart';
import 'package:better_day_ing/login_page.dart';

//import 'package:app_screen1/reg_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Page',
      theme: ThemeData(
        // primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: //risk_factor()
      loginPage(),
    );
  }
}