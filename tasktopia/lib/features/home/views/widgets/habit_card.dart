import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:tasktopia/app/utils/constants/app_colors.dart';
import 'package:tasktopia/app/utils/constants/app_measures.dart';
import 'package:tasktopia/features/home/bloc/task_bloc.dart';

class HabitCard extends StatefulWidget {
  const HabitCard(
      {super.key,
      required this.counter,
      required this.id,
      required this.title});

  final int id;
  final String title;
  final int counter;

  @override
  State<HabitCard> createState() => _HabitCardState();
}

class _HabitCardState extends State<HabitCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
          border: Border.all(width: 1), borderRadius: BorderRadius.circular(8)),
      child: Slidable(
        endActionPane: ActionPane(motion: const DrawerMotion(), children: [
          SlidableAction(
            onPressed: (context) {
              context.read<TaskBloc>().deleteSpecificTask(widget.id);
            },
            backgroundColor: AppColors.appRed,
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          ),
          SlidableAction(
            onPressed: (context) {},
            backgroundColor: AppColors.secondaryColor,
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Edit',
          ),
        ]),
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                height: 50,
                width: 50,
                color: AppColors.primaryColor,
                child: const Icon(Icons.add, color: AppColors.appWhite),
              ),
              SizedBox(
                width: AppMeasures.getSize(context).width * 0.02,
              ),
              Expanded(
                flex: 4,
                child: SizedBox(
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          widget.title,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: AppMeasures.getSize(context).width * 0.02,
              ),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.counter.toString(),
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
