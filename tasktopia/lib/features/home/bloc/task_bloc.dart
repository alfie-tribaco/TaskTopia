import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasktopia/features/home/bloc/task_state.dart';
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
      log(e.toString());
    }
  }
}
