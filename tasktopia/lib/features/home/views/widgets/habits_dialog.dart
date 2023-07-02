import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasktopia/app/utils/constants/app_colors.dart';
import 'package:tasktopia/app/utils/constants/app_measures.dart';
import 'package:tasktopia/features/home/bloc/habit_bloc.dart';
import 'package:tasktopia/features/home/models/habit.dart';

class HabitsDialog extends StatefulWidget {
  const HabitsDialog({super.key});

  @override
  State<HabitsDialog> createState() => _HabitsDialogState();
}

class _HabitsDialogState extends State<HabitsDialog> {
  TextEditingController habitTitleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(30),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),
                  Text(
                    "Create habit",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const Spacer(),
                  GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(Icons.close)),
                ],
              ),
              SizedBox(
                height: AppMeasures.getSize(context).height * 0.04,
              ),
              TextField(
                controller: habitTitleController,
                style: Theme.of(context).textTheme.bodyMedium,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(width: 5)),
                  label: Text(
                    "Name of your habit",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ),
              SizedBox(
                height: AppMeasures.getSize(context).height * 0.03,
              ),
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryColor),
                      onPressed: () {
                        context.read<HabitBloc>().addHabit(Habit(
                              counter: 0,
                              title: habitTitleController.text,
                            ));
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Add Habit",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: AppColors.appWhite),
                      ))),
            ],
          ),
        ),
      ),
    );
  }
}
