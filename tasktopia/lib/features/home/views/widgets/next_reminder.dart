import 'package:flutter/material.dart';
import 'package:tasktopia/app/utils/constants/app_colors.dart';
import 'package:tasktopia/app/utils/constants/app_measures.dart';

class NextReminder extends StatefulWidget {
  const NextReminder({super.key});

  @override
  State<NextReminder> createState() => _NextReminderState();
}

class _NextReminderState extends State<NextReminder> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Text('Upcoming Reminder',
              style: Theme.of(context).textTheme.bodyLarge),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                gradient: const LinearGradient(
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
