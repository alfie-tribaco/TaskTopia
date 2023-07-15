import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasktopia/features/home/bloc/task_state.dart';
import 'package:tasktopia/features/home/models/task.dart';
import 'package:tasktopia/features/home/repository/task_repository.dart';

class TaskBloc extends Cubit<TaskState> {
  TaskBloc(TaskState initialState) : super(initialState);

  final TaskRepository _repository = TaskRepository();

  Future<void> loadAllTask() async {
    emit(LoadingTaskState());
    try {
      var tasks = await _repository.retrieveAllTask();
      emit(SuccessTaskState(tasks!));
    } catch (e) {
      emit(ErrorTaskState());
      log("Task bloc: $e");
    }
  }

  Future<void> updateSpecificTask(Task task) async {
    try {
      await _repository.updateTask(task);
      await loadAllTask();
    } catch (e) {
      log("Task bloc: $e");
    }
  }

  Future<void> deleteSpecificTask(int id) async {
    try {
      await _repository.removeTask(id);
      await loadAllTask();
    } catch (e) {
      log("Task bloc: $e");
    }
  }

  Future<void> addOneTask(Task task) async {
    try {
      await _repository.addTask(task);
      await loadAllTask();
    } catch (e) {
      log("Task bloc: $e");
    }
  }
}
