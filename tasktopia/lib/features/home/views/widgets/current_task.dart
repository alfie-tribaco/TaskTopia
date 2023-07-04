import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasktopia/app/utils/constants/app_colors.dart';
import 'package:tasktopia/app/utils/constants/app_measures.dart';
import 'package:tasktopia/app/utils/helper/duration_helper.dart';
import 'package:tasktopia/app/utils/helper/task_helper.dart';
import 'package:tasktopia/features/home/bloc/task_bloc.dart';

class CurrentTask extends StatefulWidget {
  const CurrentTask({super.key});

  @override
  State<CurrentTask> createState() => _CurrentTaskState();
}

class _CurrentTaskState extends State<CurrentTask>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    animation =
        ColorTween(begin: AppColors.primaryColor, end: AppColors.gradientEnd)
            .animate(_controller)
          ..addListener(() {
            setState(() {});
          });

    _controller.forward();
    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CurrentTaskHelper>(
      builder: (context, value, child) {
        if (value.isDone == true) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Text('Task is Done',
                    style: Theme.of(context).textTheme.bodyLarge),
                GestureDetector(
                  onTap: () {
                    context
                        .read<TaskBloc>()
                        .deleteSpecificTask(value.task.id!)
                        .whenComplete(() {
                      context.read<CurrentTaskHelper>().restartDoneState();
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        gradient: const LinearGradient(colors: [
                          AppColors.appOrange,
                          AppColors.appYellow
                        ])),
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    width: AppMeasures.getSize(context).width,
                    height: 80,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Timer is done, click here to delete task",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                    color: AppColors.appBlack, fontSize: 17)),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        } else if (value.isDone == false) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Text('In Progress Task',
                    style: Theme.of(context).textTheme.bodyLarge),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: animation.value,
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  width: AppMeasures.getSize(context).width,
                  height: 80,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Text("Current Task :",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      color: AppColors.appWhite,
                                    )),
                            Text(value.task.title,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(color: AppColors.appWhite)),
                          ],
                        ),
                      ),
                      Consumer<DurationHelper>(
                        builder: (context, value, child) {
                          if (value.isEnded == true) {
                            context.read<CurrentTaskHelper>().endSpecificTask();
                          }
                          return Expanded(
                            child: Column(
                              children: [
                                Text("Time :",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                          color: AppColors.appWhite,
                                        )),
                                Text(
                                  "${value.duration.inMinutes} min ${value.duration.inSeconds % 60} sec",
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(color: AppColors.appWhite),
                                ),
                              ],
                            ),
                          );
                        },
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        } else {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Text('Current Task',
                    style: Theme.of(context).textTheme.bodyLarge),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: AppColors.appGrey),
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  width: AppMeasures.getSize(context).width,
                  height: 80,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Not Currently Working on Task",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                  color: AppColors.appWhite, fontSize: 20)),
                    ],
                  ),
                )
              ],
            ),
          );
        }
      },
    );
  }
}
