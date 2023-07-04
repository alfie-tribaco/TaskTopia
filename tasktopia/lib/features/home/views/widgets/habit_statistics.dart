import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasktopia/app/utils/constants/app_colors.dart';
import 'package:tasktopia/app/utils/constants/app_measures.dart';
import 'package:tasktopia/features/home/bloc/habit_bloc.dart';
import 'package:tasktopia/features/home/bloc/habit_state.dart';
import 'package:tasktopia/features/home/bloc/task_bloc.dart';
import 'package:tasktopia/features/home/models/habit.dart';

class HabitStatistics extends StatefulWidget {
  const HabitStatistics({super.key});

  @override
  State<HabitStatistics> createState() => _HabitStatisticsState();
}

class _HabitStatisticsState extends State<HabitStatistics> {
  Habit? frequentHabit;
  Habit? rareHabit;

  @override
  void initState() {
    fetchStats();
    super.initState();
  }

  fetchStats() async {
    final highestHabit =
        await context.read<HabitBloc>().retreiveFrequentHabit();

    final lowestHabit = await context.read<HabitBloc>().retreiveRareHabit();
    setState(() {
      frequentHabit = highestHabit;
      rareHabit = lowestHabit;
    });
  }

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
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            width: AppMeasures.getSize(context).width,
            height: 80,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text("Frequent Habit",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                  color: AppColors.appWhite, fontSize: 20)),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        height: 25,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: AppColors.appWhite,
                        ),
                        child: Text(
                            frequentHabit == null
                                ? "None"
                                : frequentHabit!.title,
                            overflow: TextOverflow.ellipsis),
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Rare Habit",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: AppColors.appWhite, fontSize: 20),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        height: 25,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: AppColors.appWhite,
                        ),
                        child: Text(
                          rareHabit == null ? "None" : rareHabit!.title,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
