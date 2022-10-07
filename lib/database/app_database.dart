import 'package:my_app/database/dao/contacts_dao.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> createDatabase() async {
  String pathDB = await getDatabasesPath();
  String nameDB = "bytebank01.db";
  final String path = join(pathDB, nameDB);

  Database databaseReturn = await openDatabase(path, onCreate: (db, version) {
    db.execute(ContactDAO.contactsSQL);
  }, version: 1, onDowngrade: onDatabaseDowngradeDelete);

  return databaseReturn;
}
