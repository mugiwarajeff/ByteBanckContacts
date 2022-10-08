import 'package:my_app/src/features/transferencies/models/transferency_model.dart';
import 'package:sqflite/sqflite.dart';

import '../app_database.dart';

class ContactDAO {
  static const String _tableName = "transferencies";
  static const String _id = "id";
  static const String _name = "name";
  static const String _accountNumber = "account_number";

  static const String contactsSQL = 'CREATE TABLE $_tableName('
      '$_id INTEGER PRIMARY KEY, '
      '$_name TEXT, '
      '$_accountNumber INTEGER)';

  Future<int> insertDataBase(Transferency contact) async {
    Database db = await createDatabase();
    int dadoinserido = await db.insert(_tableName, toMap(contact));

    return dadoinserido;
  }

  Future<List<Transferency>> getAll() async {
    Database database = await createDatabase();
    List<Map<String, dynamic>> returnGetAll = await database.query(_tableName);

    return toList(returnGetAll);
  }

  Future<int> deleteByObject(Transferency contact) async {
    Database database = await createDatabase();

    int numberForReturn = await database
        .delete(_tableName, where: "$_id = ?", whereArgs: [contact.id]);

    return numberForReturn;
  }

  //Methos toList and toMap for complements the other methods getAll and insert
  List<Transferency> toList(List<Map<String, dynamic>> contacts) {
    List<Transferency> contactList = contacts.map((mapContact) {
      return Transferency(
          id: mapContact[_id],
          name: mapContact[_name],
          number: mapContact[_accountNumber]);
    }).toList();

    return contactList;
  }

  Map<String, dynamic> toMap(Transferency contact) {
    Map<String, dynamic> mapContact = {};

    mapContact[_name] = contact.name;
    mapContact[_accountNumber] = contact.number;

    return mapContact;
  }
}
