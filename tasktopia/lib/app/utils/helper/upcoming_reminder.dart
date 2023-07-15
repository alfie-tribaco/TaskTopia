import 'package:flutter/material.dart';

class UpcomingReminderHelper extends ChangeNotifier {
  String upcomingReminderName = "No Upcoming Reminder";

  void updateUpcomingReminder(name) {
    if (name == null) {
      // Do Nothing
    } else {
      upcomingReminderName = name;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        notifyListeners();
      });
    }
  }
}
