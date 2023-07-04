import 'dart:developer';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;

class LocalNotificationApi {
  static final _notifications = FlutterLocalNotificationsPlugin();

  Future<void> initLocalNotification() async {
    try {
      AndroidInitializationSettings initializationSettingsAndroid =
          const AndroidInitializationSettings('@drawable/icon_name_logo');
      var initializationSettings =
          InitializationSettings(android: initializationSettingsAndroid);
      await _notifications.initialize(initializationSettings);
    } catch (e) {
      log("Local Notification : $e");
    }
  }

  static Future<void> showNotification(
      {int id = 0,
      required String title,
      required String description,
      required String payload}) async {
    try {
      _notifications.show(id, title, description, await _notificationDetails(),
          payload: payload);
    } catch (e) {
      log("Local Notification : $e");
    }
  }

  static Future<void> scheduledNotification(
      {int id = 0,
      required String title,
      required String description,
      required String payload,
      required Duration duration}) async {
    var scheduledDuration = DateTime.now().add(duration);

    print("Duration : $duration");

    try {
      await _notifications.zonedSchedule(
          id,
          title,
          description,
          tz.TZDateTime.from(scheduledDuration, tz.local),
          await _notificationDetails(),
          androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
          uiLocalNotificationDateInterpretation:
              UILocalNotificationDateInterpretation.wallClockTime);
    } catch (e) {
      log("Local Notification : $e");
    }
  }

  static Future _notificationDetails() async {
    try {
      return const NotificationDetails(
          android: AndroidNotificationDetails('tasktopia', 'taskstopia',
              channelDescription:
                  "Tasktopia Channel Notification to Notify Users for their reminders",
              importance: Importance.max));
    } catch (e) {
      log("Local Notification : $e");
    }
  }
}
