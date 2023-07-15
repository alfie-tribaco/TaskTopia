import 'dart:developer';

import 'package:sqflite/sqflite.dart';
import 'package:tasktopia/features/home/models/reminder.dart';
import 'package:tasktopia/services/local_storage/local_database.dart';
import 'package:tasktopia/services/notification_service/local_notification.dart';

class ReminderRepository {
  Database? db;

  Future<void> openLocalDatabaseConnection() async {
    db = await LocalDatabase().openLocalDatabase();
  }

  Future<void> addReminder(
      Reminder reminder, int days, int hours, int minutes) async {
    try {
      await openLocalDatabaseConnection();
      await db!
          .insert(LocalDatabase.tableReminderName, reminder.toDatabaseJson())
          .then((value) {
        LocalNotificationApi.scheduledNotification(
          id: value,
          title: reminder.title,
          description: "I would like to remind your agenda for today",
          payload: "Reminder Notification",
          duration: Duration(days: days, hours: hours, minutes: minutes),
        );
      });
    } catch (e) {
      log("Reminder Repo: $e");
    }
  }

  Future<Reminder?> getUpcomingReminder() async {
    try {
      final String currentDate = DateTime.now().toIso8601String();
      await openLocalDatabaseConnection();
      final List<Map<String, dynamic>> result = await db!.rawQuery(
          '''SELECT * FROM ${LocalDatabase.tableReminderName} WHERE ${LocalDatabase.columnReminderDate} >= ? ORDER BY ${LocalDatabase.columnReminderDate} DESC LIMIT 1''',
          [currentDate]);

      if (result.isNotEmpty) {
        return Reminder(
            date: result.first['date'],
            time: result.first['time'],
            title: result.first['title'],
            id: result.first['id']);
      } else {
        return null;
      }
    } catch (e) {
      log("Reminder Repo: $e");
      return null;
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
          where: '${LocalDatabase.columnReminderId} = ?',
          whereArgs: [id]).whenComplete(() async {
        await LocalNotificationApi.deleteNotification(id);
      });
    } catch (e) {
      log("Reminder Repo: $e");
    }
  }
}
