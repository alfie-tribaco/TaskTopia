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
      await db!.insert(LocalDatabase.tableTaskName, task.toDatabaseJson());
    } catch (e) {
      log("Task Repo: $e");
    }
  }

  Future<void> removeTask(int id) async {
    try {
      await openLocalDatabaseConnection();
      await db!.delete(LocalDatabase.tableTaskName,
          where: '${LocalDatabase.columnHabitId} = ?', whereArgs: [id]);
    } catch (e) {
      log("Task Repo: $e");
    }
  }

  Future<void> updateTask(Task task) async {
    try {
      await openLocalDatabaseConnection();
      await db!.update(LocalDatabase.tableTaskName, task.toDatabaseJson(),
          where: '${LocalDatabase.columnHabitId} = ?', whereArgs: [task.id]);
    } catch (e) {
      log("Task Repo: $e");
    }
  }

  Future<List<Task>?> retrieveAllTask() async {
    try {
      await openLocalDatabaseConnection();
      List<Map<String, Object?>> taskMaps =
          await db!.query(LocalDatabase.tableTaskName);
      return taskMaps.map((taskMap) => Task.fromDatabaseJson(taskMap)).toList();
    } catch (e) {
      if (e is DatabaseException) {
        return [];
      } else {
        log("Task Repo: $e");
        return null;
      }
    }
  }

  Future<Task?> retreiveSpecificTask(int id) async {
    try {
      await openLocalDatabaseConnection();

      List<Map<String, Object?>> taskMaps = await db!.query(
          LocalDatabase.tableTaskName,
          where: '${LocalDatabase.columnHabitId} = ?',
          whereArgs: [id]);
      if (taskMaps.isNotEmpty) {
        return Task.fromDatabaseJson(taskMaps.first);
      }
    } catch (e) {
      log("Task Repo: $e");
      return null;
    }
    return null;
  }
}
