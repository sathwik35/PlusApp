import 'package:flutter/material.dart';
import 'login.dart';

void main()=> runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(
        primaryColor: new Color(0xFF81BD1D)
      ),
      home: new LoginPage(),
    );
  }
}