import 'dart:developer';
import 'package:sqflite/sqflite.dart';
import 'package:tasktopia/features/home/models/habit.dart';
import 'package:tasktopia/services/local_storage/local_database.dart';

class HabitRepository {
  Database? db;

  Future<void> openLocalDatabaseConnection() async {
    db = await LocalDatabase().openLocalDatabase();
  }

  Future<void> addHabit(Habit habit) async {
    try {
      await openLocalDatabaseConnection();
      await db!.insert(LocalDatabase.tableHabitName, habit.toDatabaseJson());
    } catch (e) {
      log("Habit Repo: $e");
    }
  }

  Future<void> updateHabit(Habit habit) async {
    try {
      await openLocalDatabaseConnection();
      await db!.update(LocalDatabase.tableHabitName, habit.toDatabaseJson(),
          where: '${LocalDatabase.columnHabitId} = ?', whereArgs: [habit.id]);
    } catch (e) {
      log("Habit Repo: $e");
    }
  }

  Future<List<Habit>?> retreiveAllHabits() async {
    try {
      await openLocalDatabaseConnection();
      List<Map<String, Object?>> habitMaps =
          await db!.query(LocalDatabase.tableHabitName);
      return habitMaps
          .map((habitMap) => Habit.fromDatabaseJson(habitMap))
          .toList();
    } catch (e) {
      log("Habit Repo: $e");
      return null;
    }
  }

  Future<void> removeHabit(int id) async {
    try {
      await openLocalDatabaseConnection();
      await db!.delete(LocalDatabase.tableHabitName,
          where: '${LocalDatabase.columnHabitId} = ?', whereArgs: [id]);
    } catch (e) {
      log("Habit Repo: $e");
    }
  }

  Future<Habit?> retrieveSpecificHabit(int id) async {
    try {
      await openLocalDatabaseConnection();

      List<Map<String, Object?>> habitMaps = await db!.query(
          LocalDatabase.tableHabitName,
          where: '${LocalDatabase.columnHabitId} = ?',
          whereArgs: [id]);
      if (habitMaps.isNotEmpty) {
        return Habit.fromDatabaseJson(habitMaps.first);
      }
    } catch (e) {
      log("Habit Repo: $e");
      return null;
    }
    return null;
  }
}
