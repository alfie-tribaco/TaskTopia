import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:provider/provider.dart';
import 'package:tasktopia/app/utils/constants/app_colors.dart';
import 'package:tasktopia/app/utils/helper/panel_helper.dart';
import 'package:tasktopia/app/utils/shared/widgets/app_bar.dart';
import 'package:tasktopia/features/home/views/widgets/current_task.dart';
import 'package:tasktopia/features/home/views/widgets/daily_task_dialog.dart';
import 'package:tasktopia/features/home/views/widgets/habit_statistics.dart';
import 'package:tasktopia/features/home/views/widgets/habits_dialog.dart';
import 'package:tasktopia/features/home/views/widgets/next_reminder.dart';
import 'package:tasktopia/features/home/views/widgets/option_list.dart';
import 'package:tasktopia/features/home/views/widgets/reminder_dialog.dart';
import 'package:tasktopia/features/home/views/widgets/task_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: SpeedDial(
          animatedIcon: AnimatedIcons.menu_close,
          foregroundColor: AppColors.appWhite,
          backgroundColor: AppColors.primaryColor,
          overlayOpacity: 0.5,
          overlayColor: AppColors.appBlack,
          children: [
            SpeedDialChild(
                child: const Icon(
                  Icons.note_add,
                  color: AppColors.appWhite,
                ),
                label: "Reminder",
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (builder) {
                        return const ReminderDialog();
                      });
                },
                backgroundColor: AppColors.primaryColor),
            SpeedDialChild(
                child: const Icon(Icons.task_alt, color: AppColors.appWhite),
                label: "Daily Task",
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (builder) {
                        return const DailyTaskDialog();
                      });
                },
                backgroundColor: AppColors.primaryColor),
            SpeedDialChild(
                child: const Icon(Icons.list, color: AppColors.appWhite),
                label: "Habits",
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (builder) {
                        return const HabitsDialog();
                      });
                },
                backgroundColor: AppColors.primaryColor),
          ],
        ),
        appBar: const CustomAppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Consumer<PanelHelper>(
                builder: (context, value, child) {
                  if (value.currentPage == 0) {
                    return const HabitStatistics();
                  } else if (value.currentPage == 1) {
                    return const CurrentTask();
                  } else {
                    return const NextReminder();
                  }
                },
              ),
              const TaskList()
            ],
          ),
        ),
      ),
    );
  }
}
