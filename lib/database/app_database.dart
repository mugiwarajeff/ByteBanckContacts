import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

createDatabase() async {
  String pathDB = await getDatabasesPath();
  String nameDB = "bytebank.db";
  String path = join(pathDB, nameDB);

  openDatabase(
    path,
    onCreate: (db, version) {
      db.execute(
          "CREATE TABLE contacts (id INTEGER PRIMARY KEY, name TEXT, account_number INTEGER");
    },
  );
}
