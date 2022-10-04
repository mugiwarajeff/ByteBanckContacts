import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../src/shared/models/contact_model.dart';

Future<Database> createDatabase() async {
  String pathDB = await getDatabasesPath();
  String nameDB = "bytebank01.db";
  final String path = join(pathDB, nameDB);

  Database databaseReturn = await openDatabase(
    path,
    onCreate: (db, version) {
      db.execute('CREATE TABLE contacts('
          'id INTEGER PRIMARY KEY, '
          'name TEXT, '
          'account_number INTEGER)');
    },
    version: 1,
  );

  return databaseReturn;
}

Future<int> inserDataBase(Contact contact) async {
  Database db = await createDatabase();
  Map<String, dynamic> mapContact = {};

  mapContact["name"] = contact.name;
  mapContact["account_number"] = contact.number;

  debugPrint(mapContact.toString());

  int dadoinserido = await db.insert("contacts", mapContact);

  return dadoinserido;
}

Future<List<Contact>> getAll() async {
  Database database = await createDatabase();
  List<Map<String, dynamic>> returnGetAll = await database.query("contacts");

  List<Contact> contactList = returnGetAll.map((mapContact) {
    return Contact(
        id: mapContact["id"],
        name: mapContact["name"],
        number: mapContact["account_number"]);
  }).toList();

  return contactList;
}
