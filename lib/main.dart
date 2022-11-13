import 'package:flutter/material.dart';
import 'package:my_app/database/dao/contacts_dao.dart';
import 'package:my_app/src/features/home/home_page.dart';
import 'package:my_app/src/features/transferency_form/widgets/confirm_dialog.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ContactDAO contactDAO = ContactDAO();

    return MaterialApp(
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
              primary: Colors.green[700], secondary: Colors.blue[600]),
          buttonTheme: ButtonThemeData(
              buttonColor: Colors.blueAccent[700],
              textTheme: ButtonTextTheme.primary)),
      home: HomePage(contactDAO: contactDAO),
    );
  }
}
