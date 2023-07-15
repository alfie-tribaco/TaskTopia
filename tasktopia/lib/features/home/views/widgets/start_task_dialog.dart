import 'package:duration_picker/duration_picker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:tasktopia/app/utils/constants/app_colors.dart';
import 'package:tasktopia/app/utils/constants/app_measures.dart';
import 'package:tasktopia/app/utils/helper/duration_helper.dart';
import 'package:tasktopia/app/utils/helper/task_helper.dart';
import 'package:tasktopia/features/home/models/task.dart';

class StartTaskDialog extends StatefulWidget {
  const StartTaskDialog(
      {super.key,
      required this.title,
      required this.duedate,
      required this.id,
      required this.severity,
      required this.description});

  final String title;
  final int id;
  final String description;
  final String severity;
  final String duedate;

  @override
  State<StartTaskDialog> createState() => _StartTaskDialogState();
}

class _StartTaskDialogState extends State<StartTaskDialog> {
  late FToast fToast;

  @override
  void initState() {
    fToast = FToast();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Consumer<DurationHelper>(
            builder: (context, value, child) {
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Start This Task",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(Icons.cancel_sharp)),
                    ],
                  ),
                  SizedBox(
                    height: AppMeasures.getSize(context).height * 0.03,
                  ),
                  SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return Dialog(
                                    child: Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: SingleChildScrollView(
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "Pick Duration",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyLarge,
                                                ),
                                                GestureDetector(
                                                    onTap: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child: const Icon(
                                                        Icons.cancel_sharp)),
                                              ],
                                            ),
                                            Consumer<DurationHelper>(
                                              builder: (context, value, child) {
                                                return Column(
                                                  children: [
                                                    DurationPicker(
                                                      duration: value.duration,
                                                      onChange: (val) {
                                                        context
                                                            .read<
                                                                DurationHelper>()
                                                            .changeDuration(
                                                                val);
                                                      },
                                                      snapToMins: 5.0,
                                                    ),
                                                    FilledButton(
                                                        onPressed: () {
                                                          if (value.duration ==
                                                              const Duration(
                                                                  hours: 0,
                                                                  minutes: 0)) {
                                                          } else {
                                                            Navigator.pop(
                                                                context);
                                                          }
                                                        },
                                                        child: const Text(
                                                            "Set Duration"))
                                                  ],
                                                );
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                });
                          },
                          child: Text(value.duration ==
                                  const Duration(hours: 0, minutes: 0)
                              ? "Pick Time"
                              : "${value.duration.inMinutes} minutes"))),
                  SizedBox(
                    height: AppMeasures.getSize(context).height * 0.03,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: context.read<DurationHelper>().duration ==
                            const Duration(minutes: 0, hours: 0)
                        ? FilledButton(
                            style: FilledButton.styleFrom(
                                backgroundColor: AppColors.appGrey),
                            onPressed: () {
                              fToast.showToast(
                                  child: const Text(
                                      "You cannot Start this task without selecting duration"));
                            },
                            child: const Text(
                              "Start This Task",
                            ))
                        : FilledButton(
                            onPressed: () {
                              context
                                  .read<CurrentTaskHelper>()
                                  .startSpecificTask(
                                      Task(
                                          id: widget.id,
                                          description: widget.description,
                                          duedate: widget.duedate,
                                          severity: widget.severity,
                                          title: widget.title),
                                      context.read<DurationHelper>().duration);

                              context
                                  .read<DurationHelper>()
                                  .decrementDuration();
                              Navigator.pop(context);
                            },
                            child: const Text("Start This Task"),
                          ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
