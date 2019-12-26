import 'package:flutter/material.dart';
import 'package:pro1/HomePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AppName',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        textTheme: TextTheme(
          title: TextStyle(color: Colors.black54),
        ),
      ),
      home: HomePage(),
    );
  }
}
