import 'package:flutter/material.dart';
import 'package:pro1/HomePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AppName',
      theme: ThemeData(
        primaryColor: Colors.yellow,
        accentColor: Colors.blueGrey,
        fontFamily: 'Roboto',
        backgroundColor: Colors.white,
        scaffoldBackgroundColor: Colors.grey[50],
        appBarTheme: AppBarTheme(
          textTheme: TextTheme(
            title: TextStyle(
              color: Colors.black54,
              fontSize: 20,
              fontFamily: 'Roboto Condensed',
              fontWeight: FontWeight.bold,
            ),
            subtitle: TextStyle(
              color: Colors.black54,
              fontSize: 16,
              fontFamily: 'Roboto Condensed',
              // fontWeight: FontWeight.bold,
            ),
          ),
        ),
        textTheme: TextTheme(
          body1: TextStyle(
            color: Colors.black54,
            fontSize: 18,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: HomePage(),
    );
  }
}
