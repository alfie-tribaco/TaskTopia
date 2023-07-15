import 'dart:async';

import 'package:flutter/material.dart';

class DurationHelper extends ChangeNotifier {
  Duration duration = const Duration(minutes: 0);
  bool? isEnded;

  changeDuration(newDuration) {
    duration = newDuration;
    notifyListeners();
  }

  decrementDuration() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      duration = duration - const Duration(seconds: 1);
      if (duration == const Duration(minutes: 0)) {
        timer.cancel();
        isEnded = true;
        notifyListeners();
      }
      notifyListeners();
    });
  }

  restartDuration() {
    duration = const Duration(minutes: 0);
    isEnded = null;
  }
}
