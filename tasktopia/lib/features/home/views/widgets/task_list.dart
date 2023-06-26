import 'package:flutter/material.dart';
import 'package:tasktopia/app/utils/constants/app_colors.dart';

class TaskList extends StatefulWidget {
  const TaskList({super.key});

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            child: Row(
              children: [
                Container(
                  height: 50,
                  width: 100,
                  color: AppColors().primaryColor,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
