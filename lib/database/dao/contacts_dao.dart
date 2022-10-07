import 'package:sqflite/sqflite.dart';

import '../../src/shared/models/contact_model.dart';
import '../app_database.dart';

class ContactDAO {
  static const String _tableName = "contacts";
  static const String _id = "id";
  static const String _name = "name";
  static const String _accountNumber = "account_number";

  static const String contactsSQL = 'CREATE TABLE $_tableName('
      '$_id INTEGER PRIMARY KEY, '
      '$_name TEXT, '
      '$_accountNumber INTEGER)';

  Future<int> insertDataBase(Contact contact) async {
    Database db = await createDatabase();
    int dadoinserido = await db.insert(_tableName, toMap(contact));

    return dadoinserido;
  }

  Future<List<Contact>> getAll() async {
    Database database = await createDatabase();
    List<Map<String, dynamic>> returnGetAll = await database.query(_tableName);

    return toList(returnGetAll);
  }

  Future<int> deleteByObject(Contact contact) async {
    Database database = await createDatabase();

    int numberForReturn = await database
        .delete(_tableName, where: "$_id = ?", whereArgs: [contact.id]);

    return numberForReturn;
  }

  //Methos toList and toMap for complements the other methods getAll and insert
  List<Contact> toList(List<Map<String, dynamic>> contacts) {
    List<Contact> contactList = contacts.map((mapContact) {
      return Contact(
          id: mapContact[_id],
          name: mapContact[_name],
          number: mapContact[_accountNumber]);
    }).toList();

    return contactList;
  }

  Map<String, dynamic> toMap(Contact contact) {
    Map<String, dynamic> mapContact = {};

    mapContact[_name] = contact.name;
    mapContact[_accountNumber] = contact.number;

    return mapContact;
  }
}
