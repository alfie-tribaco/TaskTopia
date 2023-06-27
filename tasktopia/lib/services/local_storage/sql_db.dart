import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class LocalDatabaseService {
  getDatabasePath() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'tasktopia_db.db');
    return path;
  }

  deleteDatabase() async {}
}
