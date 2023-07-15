import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasktopia/features/home/bloc/reminder_state.dart';
import 'package:tasktopia/features/home/models/reminder.dart';
import 'package:tasktopia/features/home/repository/reminder_repository.dart';

class ReminderBloc extends Cubit<ReminderState> {
  ReminderBloc(ReminderState initialState) : super(initialState);

  final ReminderRepository _repository = ReminderRepository();

  Future<void> addRemider(
      Reminder reminder, int days, int hours, int minutes) async {
    try {
      await _repository.addReminder(reminder, days, hours, minutes);
      retrieveAllReminder();
    } catch (e) {
      log("Reminder Bloc: $e");
    }
  }

  Future<void> deleteReminder(int id) async {
    try {
      await _repository.removeReminder(id);
      retrieveAllReminder();
    } catch (e) {
      log("Reminder Bloc: $e");
    }
  }

  Future<void> updateReminder(Reminder reminder) async {
    try {
      await _repository.updateReminder(reminder);
      retrieveAllReminder();
    } catch (e) {
      log("Reminder Bloc: $e");
    }
  }

  Future<Reminder?> getTheUpcomingReminder() async {
    try {
      return await _repository.getUpcomingReminder();
    } catch (e) {
      log("Reminder Bloc: $e");
      return null;
    }
  }

  Future<void> retrieveAllReminder() async {
    emit(LoadingReminderState());
    try {
      var listOfReminder = await _repository.retreiveAllReminders();
      await getTheUpcomingReminder();
      emit(SuccessReminderState(listOfReminder: listOfReminder!));
    } catch (e) {
      log("Reminder Bloc: $e");
      emit(ErrorReminderState());
    }
  }
}
