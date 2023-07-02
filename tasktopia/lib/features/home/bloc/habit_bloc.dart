import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasktopia/features/home/bloc/habit_state.dart';
import 'package:tasktopia/features/home/models/habit.dart';
import 'package:tasktopia/features/home/repository/habit_repository.dart';

class HabitBloc extends Cubit<HabitState> {
  HabitBloc(HabitState initialState) : super(initialState);

  final HabitRepository _repository = HabitRepository();

  Future<void> loadAllHabits() async {
    try {
      var habits = await _repository.retreiveAllHabits();
      emit(SuccessHabitState(habits: habits!));
    } catch (e) {
      log("Habit bloc: $e");
    }
  }

  Future<void> addHabit(Habit habit) async {
    print('test');
    emit(LoadingHabitState());
    try {
      _repository.addHabit(habit);
      await loadAllHabits();
    } catch (e) {
      log("Habit bloc: $e");
    }
  }

  Future<void> incrementHabit(Habit habit) async {
    emit(LoadingHabitState());
    try {
      habit.counter++;
      await _repository.updateHabit(habit);
      await loadAllHabits();
    } catch (e) {
      log("Habit bloc: $e");
    }
  }

  Future<void> decrementHabit(Habit habit) async {
    emit(LoadingHabitState());
    try {
      habit.counter++;
      await _repository.updateHabit(habit);
      await loadAllHabits();
    } catch (e) {
      log("Habit bloc: $e");
    }
  }

  Future<void> deleteHabit(int id) async {
    emit(LoadingHabitState());
    try {
      _repository.removeHabit(id);
      await loadAllHabits();
    } catch (e) {
      log("Habit bloc: $e");
    }
  }
}
