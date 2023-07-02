import 'dart:developer';

import 'package:sqflite/sqflite.dart';
import 'package:tasktopia/features/home/models/reminder.dart';
import 'package:tasktopia/services/local_storage/local_database.dart';

class ReminderRepository {
  Database? db;

  Future<void> openLocalDatabaseConnection() async {
    db = await LocalDatabase().openLocalDatabase();
  }

  Future<void> addReminder(Reminder reminder) async {
    try {
      await openLocalDatabaseConnection();
      await db!
          .insert(LocalDatabase.tableReminderName, reminder.toDatabaseJson());
    } catch (e) {
      log("Reminder Repo: $e");
    }
  }

  Future<void> updateReminder(Reminder reminder) async {
    try {
      await openLocalDatabaseConnection();
      await db!.update(
          LocalDatabase.tableReminderName, reminder.toDatabaseJson(),
          where: '${LocalDatabase.columnReminderId} = ?',
          whereArgs: [reminder.id]);
    } catch (e) {
      log("Reminder Repo: $e");
    }
  }

  Future<List<Reminder>?> retreiveAllReminders() async {
    try {
      await openLocalDatabaseConnection();
      List<Map<String, Object?>> reminderMaps =
          await db!.query(LocalDatabase.tableReminderName);
      return reminderMaps
          .map((habitMap) => Reminder.fromDatabaseJson(habitMap))
          .toList();
    } catch (e) {
      log("Reminder Repo: $e");
      return null;
    }
  }

  Future<void> removeReminder(int id) async {
    try {
      await openLocalDatabaseConnection();
      await db!.delete(LocalDatabase.tableReminderName,
          where: '${LocalDatabase.columnReminderId} = ?', whereArgs: [id]);
    } catch (e) {
      log("Reminder Repo: $e");
    }
  }
}
