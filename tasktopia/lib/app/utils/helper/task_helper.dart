import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:tasktopia/features/home/models/task.dart';

class CurrentTaskHelper extends ChangeNotifier {
  late Task task;
  bool? isDone;
  late Duration duration;

  startSpecificTask(Task newTask, Duration newDuration) {
    try {
      task = newTask;
      duration = newDuration;
      isDone = false;
      notifyListeners();
    } catch (e) {
      log("Task Helper Exception");
    }
  }

  endSpecificTask() {
    try {
      isDone = true;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        notifyListeners();
      });
    } catch (e) {
      log("Task Helper Exception");
    }
  }

  restartDoneState() {
    try {
      isDone = null;
      notifyListeners();
    } catch (e) {
      log("Task Helper Exception");
    }
  }
}
