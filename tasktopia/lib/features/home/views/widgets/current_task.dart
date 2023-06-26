import 'package:flutter/material.dart';
import 'package:tasktopia/app/utils/constants/app_colors.dart';
import 'package:tasktopia/app/utils/constants/app_measures.dart';

class CurrentTask extends StatefulWidget {
  const CurrentTask({super.key});

  @override
  State<CurrentTask> createState() => _CurrentTaskState();
}

class _CurrentTaskState extends State<CurrentTask> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const Text('Current Task'),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                gradient: LinearGradient(colors: [
                  AppColors().primaryColor,
                  AppColors().gradientEnd
                ])),
            padding: EdgeInsets.symmetric(horizontal: 30),
            width: AppMeasures().getSize(context).width,
            height: 100,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Name of Task",
                ),
                Text("5:00")
              ],
            ),
          )
        ],
      ),
    );
  }
}
