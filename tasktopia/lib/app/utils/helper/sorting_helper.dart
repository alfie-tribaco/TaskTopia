import 'package:tasktopia/features/home/models/task.dart';

class SortingHelper {
  List<Task> sortTask(
    List<Task> listOfTask,
  ) {
    var n = listOfTask.length;

    for (int i = 0; i < n - 1; i++) {
      for (int j = 0; j < n - i - 1; j++) {
        if (listOfTask[j].id! > listOfTask[j + 1].id!) {
          Task temp = listOfTask[j];
          listOfTask[j] = listOfTask[j + 1];
          listOfTask[j + 1] = temp;
        }
      }
    }

    return listOfTask;
  }
}
