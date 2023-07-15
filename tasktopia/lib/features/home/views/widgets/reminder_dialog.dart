import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:tasktopia/app/utils/constants/app_colors.dart';
import 'package:tasktopia/app/utils/constants/app_measures.dart';
import 'package:tasktopia/app/utils/helper/reminder_helper.dart';
import 'package:tasktopia/features/home/bloc/reminder_bloc.dart';
import 'package:tasktopia/features/home/models/reminder.dart';
import 'package:tasktopia/services/notification_service/local_notification.dart';

class ReminderDialog extends StatefulWidget {
  const ReminderDialog({super.key});

  @override
  State<ReminderDialog> createState() => _ReminderDialogState();
}

class _ReminderDialogState extends State<ReminderDialog> {
  TextEditingController reminderTitleController = TextEditingController();
  late int numberOfDays;
  late int numberOfHours;
  late int numberOfMinutes;
  DateTime? dateTimeTime;
  String time = "";
  String date = "";

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
                    "Set Reminder",
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
                controller: reminderTitleController,
                style: Theme.of(context).textTheme.bodyMedium,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(width: 5)),
                  label: Text(
                    "Name of your Reminder",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ),
              SizedBox(
                height: AppMeasures.getSize(context).height * 0.03,
              ),
              const Text("When should I remind you ?"),
              ElevatedButton(onPressed: () {
                showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime.now().add(const Duration(days: 365)))
                    .then((value) {
                  if (value != null) {
                    DateTime currentDate = DateTime.now();
                    Duration difference = value.difference(currentDate);
                    numberOfDays = difference.inDays;
                    date = DateFormat.yMMMEd().format(value);
                    context.read<ReminderHelper>().changeDate(date);
                  }
                });
              }, child: Consumer<ReminderHelper>(
                builder: (context, value, child) {
                  if (value.date == "") {
                    return const Text('Set Date');
                  } else {
                    return Text(value.date);
                  }
                },
              )),
              ElevatedButton(onPressed: () {
                showTimePicker(context: context, initialTime: TimeOfDay.now())
                    .then((value) {
                  if (value != null) {
                    time = DateFormat('hh:mm a').format(DateTime(
                        DateTime.now().year,
                        DateTime.now().month,
                        DateTime.now().day,
                        value.hour,
                        value.minute));
                    dateTimeTime = DateTime(
                        DateTime.now().year,
                        DateTime.now().month,
                        DateTime.now().day,
                        value.hour,
                        value.minute);
                    context.read<ReminderHelper>().changeTimer(time);
                    var differenceForTime =
                        dateTimeTime!.difference(DateTime.now());

                    numberOfHours = differenceForTime.inHours;
                    numberOfMinutes = differenceForTime.inMinutes;
                  }
                });
              }, child: Consumer<ReminderHelper>(
                builder: (context, value, child) {
                  if (value.time == "") {
                    return const Text("Set Time");
                  } else {
                    return Text(value.time);
                  }
                },
              )),
              SizedBox(
                height: AppMeasures.getSize(context).height * 0.03,
              ),
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryColor),
                      onPressed: () {
                        if (reminderTitleController.text != "" &&
                            time != "" &&
                            date != "") {
                          context
                              .read<ReminderBloc>()
                              .addRemider(
                                  Reminder(
                                      date: date,
                                      time: time,
                                      title: reminderTitleController.text),
                                  numberOfDays,
                                  numberOfHours,
                                  numberOfMinutes)
                              .whenComplete(() {});
                          context.read<ReminderHelper>().resetState();
                          Navigator.pop(context);
                        } else {
                          Fluttertoast.showToast(
                              msg: "Please complete the field");
                        }
                      },
                      child: Text(
                        "Add Reminder",
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
