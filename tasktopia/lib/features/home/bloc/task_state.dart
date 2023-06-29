import 'package:tasktopia/features/home/models/task.dart';

abstract class TaskState {}

class LoadingTaskState extends TaskState {}

class AddTaskState extends TaskState {}

class RemoveTaskState extends TaskState {}

class UpdateTaskState extends TaskState {}

class ErrorTaskState extends TaskState {}

class InitTaskState extends TaskState {}

class SuccessTaskState extends TaskState {
  final List<Task> tasks;

  SuccessTaskState(this.tasks);
}
