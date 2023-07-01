import 'dart:developer';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class LocalDatabase {
  static const String tableName = 'tasks';
  static const String columnId = 'id';
  static const String columnTitle = 'title';
  static const String columnSeverity = 'severity';
  static const String columnDuedate = 'duedate';
  static const String columnDescription = 'description';

  late Database? db;

  Future<Database?> openLocalDatabase() async {
    try {
      final dbPath = await getDatabasesPath();
      final path = join(dbPath, 'task_topia_db.db');

      bool isDatabaseExist = await databaseExists(path);
      if (!isDatabaseExist) {
        return openDatabase(path, version: 1, onCreate: (db, version) {
          db.execute('''CREATE TABLE $tableName (
            $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
            $columnTitle TEXT, 
            $columnDuedate TEXT,
            $columnSeverity TEXT,
            $columnDescription TEXT
               )''');
        });
      } else {
        return openDatabase(path, version: 1);
      }
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  void closeDatabase() async {
    db = await openLocalDatabase();
    if (db != null) {
      await db!.close();
    } else {
      log('Database is not Initialized, Check Open Database Function');
    }
  }
}
