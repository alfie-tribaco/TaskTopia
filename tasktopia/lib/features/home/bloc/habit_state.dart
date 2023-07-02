import 'package:tasktopia/features/home/models/habit.dart';

abstract class HabitState {}

class AddHabitState extends HabitState {}

class InitHabitState extends HabitState {}

class LoadingHabitState extends HabitState {}

class DeleteHabitState extends HabitState {}

class UpdateHabitState extends HabitState {}

class SuccessHabitState extends HabitState {
  final List<Habit> habits;

  SuccessHabitState({required this.habits});
}
