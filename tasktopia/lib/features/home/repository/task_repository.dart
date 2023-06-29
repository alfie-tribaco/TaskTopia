import 'dart:developer';
import 'package:sqflite/sqflite.dart';
import 'package:tasktopia/features/home/models/task.dart';
import 'package:tasktopia/services/local_storage/local_database.dart';

class TaskRepository {
  Database? db;

  Future<void> openLocalDatabaseConnection() async {
    db = await LocalDatabase().openLocalDatabase();
  }

  Future<void> addTask(Task task) async {
    try {
      await openLocalDatabaseConnection();
      await db!.insert(LocalDatabase.tableName, task.toDatabaseJson());
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> removeTask(int id) async {
    try {
      await openLocalDatabaseConnection();
      await db!.delete(LocalDatabase.tableName,
          where: '${LocalDatabase.columnId} = ?', whereArgs: [id]);
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> updateTask(Task task) async {
    try {
      await openLocalDatabaseConnection();
      await db!.update(LocalDatabase.tableName, task.toDatabaseJson(),
          where: '${LocalDatabase.columnId} = ?', whereArgs: [task.id]);
    } catch (e) {
      log(e.toString());
    }
  }

  Future<List<Task>?> retrieveAllTask() async {
    try {
      await openLocalDatabaseConnection();
      List<Map<String, Object?>> taskMaps =
          await db!.query(LocalDatabase.tableName);
      return taskMaps.map((taskMap) => Task.fromDatabaseJson(taskMap)).toList();
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  Future<void> retreiveSpecificTask(int id) async {
    try {
      await openLocalDatabaseConnection();
      db!.query(LocalDatabase.tableName,
          where: '${LocalDatabase.columnId} = ?', whereArgs: [id]);
    } catch (e) {
      log(e.toString());
    }
  }
}
