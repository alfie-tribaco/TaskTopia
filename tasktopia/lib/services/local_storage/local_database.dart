import 'dart:developer';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class LocalDatabase {
  static const String tableName = 'tasks';
  static const String columnId = 'id';
  static const String columnTitle = 'title';
  static const String columnSeverity = 'severity';
  static const String columnDescription = 'description';

  late Database? db;

  Future<Database?> openLocalDatabase() async {
    try {
      final dbPath = await getDatabasesPath();
      final path = join(dbPath, 'task_topia_db.db');
      return openDatabase(path, version: 1, onCreate: (db, version) {
        db.execute('''CREATE TABLE $tableName (
            $columnId NTEGER PRIMARY KEY AUTOINCREMENT,
            $columnTitle TEXT, duedate TEXT,
            $columnSeverity TEXT,
            $columnDescription TEXT
               )''');
      });
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
