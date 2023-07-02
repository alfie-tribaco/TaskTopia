import 'package:flutter/material.dart';
import 'package:tasktopia/app/utils/constants/app_colors.dart';
import 'package:tasktopia/app/utils/constants/app_measures.dart';

class HabitStatistics extends StatefulWidget {
  const HabitStatistics({super.key});

  @override
  State<HabitStatistics> createState() => _HabitStatisticsState();
}

class _HabitStatisticsState extends State<HabitStatistics> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Text('Habit Statistics',
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
                Text("Habit",
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(color: AppColors.appWhite)),
                Text(
                  "habit info",
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
