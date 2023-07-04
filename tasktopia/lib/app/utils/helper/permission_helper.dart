import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:permission_handler/permission_handler.dart';

class AppPermissionHandler {
  Future<void> checkPermissionStatus() async {
    await checkNotificationPermission();
    await checkAlarmPermission();
  }

  Future<void> checkNotificationPermission() async {
    PermissionStatus statusNotification = await Permission.notification.status;
    if (statusNotification.isGranted) {
      // Permission is granted
    } else if (statusNotification.isDenied) {
      await FlutterLocalNotificationsPlugin()
          .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>()
          ?.requestPermission();
    } else if (statusNotification.isPermanentlyDenied) {
      FlutterLocalNotificationsPlugin()
          .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>()
          ?.requestPermission();
    }
  }

  Future<void> checkAlarmPermission() async {
    PermissionStatus statusAlarmClock =
        await Permission.scheduleExactAlarm.status;
    if (statusAlarmClock.isGranted) {
    } else if (statusAlarmClock.isDenied) {
      await Permission.scheduleExactAlarm.request();
    } else if (statusAlarmClock.isPermanentlyDenied) {
      await Permission.scheduleExactAlarm.request();
    }
  }
}
