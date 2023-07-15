import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:tasktopia/app/utils/constants/app_colors.dart';
import 'package:tasktopia/app/utils/constants/app_measures.dart';
import 'package:tasktopia/features/home/bloc/habit_bloc.dart';
import 'package:tasktopia/features/home/models/habit.dart';

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
              context.read<HabitBloc>().deleteHabit(widget.id);
            },
            backgroundColor: AppColors.appRed,
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          ),
        ]),
        child: Container(
          color: widget.counter < -5
              ? const Color.fromARGB(255, 255, 199, 199)
              : widget.counter > 5
                  ? const Color.fromARGB(255, 226, 255, 242)
                  : AppColors.appWhite,
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              SizedBox(
                width: AppMeasures.getSize(context).width * 0.02,
              ),
              Expanded(
                flex: 5,
                child: SizedBox(
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          widget.title,
                          overflow: TextOverflow.ellipsis,
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
                flex: 4,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        context.read<HabitBloc>().decrementHabit(Habit(
                            counter: widget.counter,
                            title: widget.title,
                            id: widget.id));
                      },
                      child: Container(
                        height: 35,
                        width: 35,
                        color: AppColors.appRed,
                        child:
                            const Icon(Icons.remove, color: AppColors.appWhite),
                      ),
                    ),
                    SizedBox(
                      width: AppMeasures.getSize(context).width * 0.02,
                    ),
                    SizedBox(
                      height: 40,
                      width: 40,
                      child: Center(
                        child: Text(
                          widget.counter.toString(),
                          overflow: TextOverflow.clip,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: AppMeasures.getSize(context).width * 0.02,
                    ),
                    GestureDetector(
                      onTap: () {
                        context.read<HabitBloc>().incrementHabit(Habit(
                            counter: widget.counter,
                            title: widget.title,
                            id: widget.id));
                      },
                      child: Container(
                        height: 35,
                        width: 35,
                        color: AppColors.gradientEnd,
                        child: const Icon(Icons.add, color: AppColors.appWhite),
                      ),
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
