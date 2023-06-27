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
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Text('Current Task', style: Theme.of(context).textTheme.bodyLarge),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                gradient: LinearGradient(
                    colors: [AppColors.primaryColor, AppColors.gradientEnd])),
            padding: const EdgeInsets.symmetric(horizontal: 30),
            width: AppMeasures.getSize(context).width,
            height: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Name of Task",
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(color: AppColors.appWhite)),
                Text(
                  "5:00",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: AppColors.appWhite),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
