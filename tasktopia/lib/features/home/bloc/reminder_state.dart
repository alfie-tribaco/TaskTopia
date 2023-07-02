import 'package:tasktopia/features/home/models/reminder.dart';

abstract class ReminderState {}

class InitReminderState extends ReminderState {}

class LoadingReminderState extends ReminderState {}

class SuccessReminderState extends ReminderState {
  List<Reminder> listOfReminder;

  SuccessReminderState({required this.listOfReminder});
}

class ErrorReminderState extends ReminderState {}
