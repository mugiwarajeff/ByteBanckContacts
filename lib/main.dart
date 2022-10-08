import 'package:flutter/material.dart';
import 'package:my_app/http/http_client.dart';
import 'package:my_app/src/features/home/home_page.dart';

void main() {
  runApp(const MyApp());
  getAll();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
              primary: Colors.green[700], secondary: Colors.blue[600]),
          buttonTheme: ButtonThemeData(
              buttonColor: Colors.blueAccent[700],
              textTheme: ButtonTextTheme.primary)),
      home: const HomePage(),
    );
  }
}
