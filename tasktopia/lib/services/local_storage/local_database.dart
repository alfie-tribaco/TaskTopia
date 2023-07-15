import 'dart:developer';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class LocalDatabase {
  //Task Table
  static const String tableTaskName = 'tasks';
  static const String columnTaskId = 'id';
  static const String columnTaskTitle = 'title';
  static const String columnTaskSeverity = 'severity';
  static const String columnTaskDuedate = 'duedate';
  static const String columnTaskDescription = 'description';

//Habit Table
  static const String tableHabitName = 'habits';
  static const String columnHabitId = 'id';
  static const String columnHabitTitle = 'title';
  static const String columnHabitCounter = 'counter';

//Reminder Table
  static const String tableReminderName = 'reminders';
  static const String columnReminderId = 'id';
  static const String columnReminderTitle = 'title';
  static const String columnReminderTime = 'time';
  static const String columnReminderDate = 'date';

  late Database? db;

  Future<Database?> openLocalDatabase() async {
    try {
      final dbPath = await getDatabasesPath();

      final path = join(dbPath, 'task_topia_db.db');

      return openDatabase(
        path,
        version: 1,
        onCreate: (db, version) async {
          await db.execute('''CREATE TABLE $tableTaskName (
            $columnTaskId INTEGER PRIMARY KEY AUTOINCREMENT,
            $columnTaskTitle TEXT, 
            $columnTaskDuedate TEXT,
            $columnTaskSeverity TEXT,
            $columnTaskDescription TEXT
               )''');

          await db.execute('''CREATE TABLE $tableHabitName (
            $columnHabitId INTEGER PRIMARY KEY AUTOINCREMENT,
            $columnHabitTitle TEXT, 
            $columnHabitCounter INTEGER
               )''');

          await db.execute('''CREATE TABLE $tableReminderName (
            $columnReminderId INTEGER PRIMARY KEY AUTOINCREMENT,
            $columnReminderTitle TEXT, 
            $columnReminderTime TEXT, 
            $columnReminderDate DATE
               )''');
        },
      );
    } catch (e) {
      log("LocalDatabase: $e");
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
