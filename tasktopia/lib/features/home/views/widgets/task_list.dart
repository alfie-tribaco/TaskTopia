import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:tasktopia/app/utils/constants/app_colors.dart';
import 'package:tasktopia/app/utils/constants/app_measures.dart';
import 'package:tasktopia/app/utils/helper/panel_helper.dart';
import 'package:tasktopia/features/home/bloc/habit_bloc.dart';
import 'package:tasktopia/features/home/bloc/habit_state.dart';
import 'package:tasktopia/features/home/bloc/reminder_bloc.dart';
import 'package:tasktopia/features/home/bloc/reminder_state.dart';
import 'package:tasktopia/features/home/bloc/task_bloc.dart';
import 'package:tasktopia/features/home/bloc/task_state.dart';
import 'package:tasktopia/features/home/views/widgets/habit_card.dart';
import 'package:tasktopia/features/home/views/widgets/reminder_card.dart';
import 'package:tasktopia/features/home/views/widgets/task_card.dart';
import 'package:tasktopia/features/mini_games/views/screens/mini_game_screen.dart';

class TaskList extends StatefulWidget {
  const TaskList({super.key});

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  late PageController pageController;
  int currentPage = 1;

  @override
  void initState() {
    super.initState();
    loadLists();
    pageController = PageController(initialPage: 1);
  }

  loadLists() {
    context.read<TaskBloc>().loadAllTask();
    context.read<HabitBloc>().loadAllHabits();
    context.read<ReminderBloc>().retrieveAllReminder();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      child: SizedBox(
        child: Column(
          children: [
            SizedBox(
              //Options
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      pageController.animateToPage(0,
                          duration: const Duration(milliseconds: 1),
                          curve: Curves.easeIn);

                      setState(() {
                        currentPage = 0;
                        context.read<PanelHelper>().changePage(currentPage);
                      });
                    },
                    child: Container(
                      decoration: currentPage == 0
                          ? BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: AppColors.primaryColor,
                            )
                          : BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: AppColors.appWhite,
                              border: Border.all(
                                  color: AppColors.primaryColor, width: 3)),
                      height: 40,
                      width: AppMeasures.getSize(context).width * 0.28,
                      child: Center(
                          child: Text(
                        "Habits",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: currentPage == 0
                                ? AppColors.appWhite
                                : AppColors.appBlack),
                      )),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      pageController.animateToPage(1,
                          duration: const Duration(milliseconds: 1),
                          curve: Curves.easeIn);
                      setState(() {
                        currentPage = 1;
                        context.read<PanelHelper>().changePage(currentPage);
                      });
                    },
                    child: Container(
                      decoration: currentPage == 1
                          ? BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: AppColors.primaryColor,
                            )
                          : BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: AppColors.appWhite,
                              border: Border.all(
                                  color: AppColors.primaryColor, width: 3)),
                      height: 40,
                      width: AppMeasures.getSize(context).width * 0.28,
                      child: Center(
                          child: Text("Daily Task",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      color: currentPage == 1
                                          ? AppColors.appWhite
                                          : AppColors.appBlack))),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      pageController.animateToPage(2,
                          duration: const Duration(milliseconds: 1),
                          curve: Curves.easeIn);
                      setState(() {
                        currentPage = 2;
                        context.read<PanelHelper>().changePage(currentPage);
                      });
                    },
                    child: Container(
                      decoration: currentPage == 2
                          ? BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: AppColors.primaryColor,
                            )
                          : BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: AppColors.appWhite,
                              border: Border.all(
                                  color: AppColors.primaryColor, width: 3)),
                      height: 40,
                      width: AppMeasures.getSize(context).width * 0.28,
                      child: Center(
                          child: Text("Reminder",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      color: currentPage == 2
                                          ? AppColors.appWhite
                                          : AppColors.appBlack))),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Consumer<PanelHelper>(
                    builder: (context, value, child) {
                      if (value.currentPage == 0) {
                        return Text(
                          "My Habits",
                          style: Theme.of(context).textTheme.bodyLarge,
                        );
                      } else if (value.currentPage == 1) {
                        return Text(
                          "Daily Task",
                          style: Theme.of(context).textTheme.bodyLarge,
                        );
                      } else {
                        return Text(
                          "My Reminder",
                          style: Theme.of(context).textTheme.bodyLarge,
                        );
                      }
                    },
                  ),
                  GestureDetector(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return MiniGameScreen();
                          });
                    },
                    child: SizedBox(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          color: AppColors.primaryColor,
                        ),
                        padding: const EdgeInsets.all(5),
                        child: const Icon(
                          Icons.videogame_asset,
                          color: AppColors.appWhite,
                          size: 35,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const Divider(
              thickness: 2,
              color: AppColors.appBlack,
            ),
            const SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Spacer(),
                  Icon(
                    Icons.sort,
                    size: 30,
                  )
                ],
              ),
            ),
            SizedBox(
              width: AppMeasures.getSize(context).width,
              height: AppMeasures.getSize(context).height * 0.5,
              child: PageView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: pageController,
                  children: [
                    BlocBuilder<HabitBloc, HabitState>(
                      builder: (context, state) {
                        if (state is LoadingHabitState) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (state is SuccessHabitState) {
                          var listHabits = state.habits;

                          return listHabits.isEmpty
                              ? const Center(child: Text("No Current Habits"))
                              : ListView.builder(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 16),
                                  itemCount: listHabits.length,
                                  itemBuilder: (context, index) {
                                    return HabitCard(
                                        counter: listHabits[index].counter,
                                        id: listHabits[index].id!,
                                        title: listHabits[index].title);
                                  },
                                );
                        } else {
                          return const Center(
                            child: Text("No Habit Shown"),
                          );
                        }
                      },
                    ),
                    BlocBuilder<TaskBloc, TaskState>(
                      builder: (context, state) {
                        if (state is LoadingTaskState) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (state is SuccessTaskState) {
                          var listOfTask = state.tasks;
                          return listOfTask.isEmpty
                              ? const Center(child: Text("No Current Task"))
                              : ListView.builder(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 16),
                                  itemCount: listOfTask.length,
                                  itemBuilder: (context, index) {
                                    return TaskCard(
                                      description:
                                          listOfTask[index].description,
                                      duedate: listOfTask[index].duedate,
                                      severity: listOfTask[index].severity,
                                      title: listOfTask[index].title,
                                      id: listOfTask[index].id!,
                                    );
                                  },
                                );
                        } else {
                          return const Center(
                            child: Text("No Data shown"),
                          );
                        }
                      },
                    ),
                    BlocBuilder<ReminderBloc, ReminderState>(
                      builder: (context, state) {
                        if (state is LoadingReminderState) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (state is SuccessReminderState) {
                          var reminderList = state.listOfReminder;
                          return reminderList.isEmpty
                              ? const Center(
                                  child: Text("No Current Reminder"),
                                )
                              : ListView.builder(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 16),
                                  itemCount: reminderList.length,
                                  itemBuilder: (context, index) {
                                    return ReminderCard(
                                        date: reminderList[index].date,
                                        id: reminderList[index].id!,
                                        time: reminderList[index].time,
                                        title: reminderList[index].title);
                                  },
                                );
                        } else if (state is ErrorReminderState) {
                          return const Center(
                            child: Text("Something went wrong"),
                          );
                        } else {
                          return const Center(child: Text("No Reminder Shown"));
                        }
                      },
                    )
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
