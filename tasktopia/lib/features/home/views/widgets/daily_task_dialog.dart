import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tasktopia/app/utils/constants/app_colors.dart';
import 'package:tasktopia/app/utils/constants/app_measures.dart';
import 'package:tasktopia/features/home/bloc/task_bloc.dart';
import 'package:tasktopia/features/home/models/task.dart';
import 'package:intl/intl.dart';

class DailyTaskDialog extends StatefulWidget {
  const DailyTaskDialog(
      {super.key,
      this.description,
      this.title,
      this.duedate,
      this.severity,
      this.isUpdating});

  final String? title;
  final String? description;
  final String? duedate;
  final String? severity;
  final bool? isUpdating;

  @override
  State<DailyTaskDialog> createState() => _DailyTaskDialogState();
}

class _DailyTaskDialogState extends State<DailyTaskDialog> {
  TextEditingController taskTitleController = TextEditingController();
  TextEditingController taskDescriptionController = TextEditingController();
  TextEditingController taskDueDateController = TextEditingController();
  String severity = "Low Priority";
  String dueDate = "No Due Date";

  @override
  void initState() {
    checkIfIsUpdating();
    super.initState();
  }

  checkIfIsUpdating() {
    if (widget.isUpdating == true) {
      setState(() {
        taskTitleController.text = widget.title.toString();
        taskDescriptionController.text = widget.description.toString();
        taskDueDateController.text = widget.duedate.toString();
        severity = widget.severity.toString();
      });
    } else {
      //Do Nothing
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(30),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),
                  Text(
                    "Create Daily Task",
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
                controller: taskTitleController,
                style: Theme.of(context).textTheme.bodyMedium,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(width: 5)),
                  label: Text(
                    "Title",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ),
              SizedBox(
                height: AppMeasures.getSize(context).height * 0.03,
              ),
              TextField(
                maxLines: null,
                style: Theme.of(context).textTheme.bodyMedium,
                controller: taskDescriptionController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(width: 5)),
                    label: Text(
                      "Description",
                      style: Theme.of(context).textTheme.bodyMedium,
                    )),
              ),
              SizedBox(
                height: AppMeasures.getSize(context).height * 0.03,
              ),
              Row(
                children: [
                  const Text("Due Date:"),
                  const Spacer(),
                  FilledButton(
                      onPressed: () {
                        showDatePicker(
                                helpText: "Select Due Date",
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime.now(),
                                lastDate: DateTime.now()
                                    .add(const Duration(days: 365)))
                            .then((value) {
                          setState(() {
                            if (value != null) {
                              var formattedDate =
                                  DateFormat.MMMMEEEEd().format(value);
                              dueDate = formattedDate.toString();
                            }
                          });
                        });
                      },
                      style: FilledButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5))),
                      child: Text(dueDate)),
                ],
              ),
              SizedBox(
                height: AppMeasures.getSize(context).height * 0.03,
              ),
              Row(
                children: [
                  const Text("Level of Importance"),
                  const Spacer(),
                  DropdownButton(
                      value: severity,
                      items: const [
                        DropdownMenuItem(
                          value: 'High Priority',
                          child: Text("High Priority"),
                        ),
                        DropdownMenuItem(
                          value: 'Medium Priority',
                          child: Text("Medium Priority"),
                        ),
                        DropdownMenuItem(
                          value: 'Low Priority',
                          child: Text("Low Priority"),
                        ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          severity = value.toString();
                        });
                      }),
                ],
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
                        if (widget.isUpdating == true) {
                          context.read<TaskBloc>().updateSpecificTask(Task(
                              description: taskTitleController.text,
                              duedate: taskDescriptionController.text,
                              severity: severity,
                              title: taskTitleController.text));
                          Navigator.pop(context);
                        } else {
                          if (taskDescriptionController.text == "" ||
                              dueDate == "No Due Date" ||
                              taskTitleController.text == "") {
                            Fluttertoast.showToast(
                                msg: "Please Complete input fields");
                          } else {
                            context.read<TaskBloc>().addOneTask(Task(
                                description: taskDescriptionController.text,
                                duedate: dueDate,
                                severity: severity,
                                title: taskTitleController.text));
                            Navigator.pop(context);
                          }
                        }
                      },
                      child: Text(
                        "Add Task",
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
