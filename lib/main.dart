import 'package:flutter/material.dart';
import 'package:my_app/database/app_database.dart';
import 'package:my_app/src/features/home/home_page.dart';
import 'package:my_app/src/shared/models/contact_model.dart';
import 'package:sqflite/sqflite.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
              primary: Colors.green[700], secondary: Colors.blue[600]),
          buttonTheme: ButtonThemeData(
              buttonColor: Colors.blueAccent[700],
              textTheme: ButtonTextTheme.primary)),
      home: HomePage(),
    );
  }
}
