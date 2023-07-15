import 'package:flutter/material.dart';

class ReminderHelper extends ChangeNotifier {
  String date = "";
  String time = "";

  changeDate(newDate) {
    date = newDate;
    notifyListeners();
  }

  changeTimer(newTime) {
    time = newTime;
    notifyListeners();
  }

  resetState() {
    time = "";
    date = "";
    notifyListeners();
  }
}
