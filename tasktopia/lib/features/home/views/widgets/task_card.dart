import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasktopia/app/utils/constants/app_colors.dart';
import 'package:tasktopia/app/utils/constants/app_measures.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:tasktopia/features/home/bloc/task_bloc.dart';

class TaskCard extends StatefulWidget {
  const TaskCard(
      {super.key,
      required this.description,
      required this.duedate,
      required this.severity,
      required this.title,
      required this.id});

  final String title;
  final String description;
  final String severity;
  final String duedate;
  final int id;

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
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
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text(widget.description))
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
                      widget.severity,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: widget.severity == "Low Priority"
                              ? AppColors.primaryColor
                              : widget.severity == "Medium Priority"
                                  ? AppColors.appOrange
                                  : AppColors.appRed),
                    ),
                    Text(
                      widget.duedate,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: AppColors.appGrey),
                    )
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
