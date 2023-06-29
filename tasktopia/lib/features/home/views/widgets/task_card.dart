import 'package:flutter/material.dart';
import 'package:tasktopia/app/utils/constants/app_measures.dart';

class TaskCard extends StatefulWidget {
  const TaskCard({super.key});

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          border: Border.all(width: 1), borderRadius: BorderRadius.circular(8)),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: SizedBox(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Go to Grocery",
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(fontSize: 20),
                    ),
                  ),
                  const Text(
                      "Buy apple, sinigang mix, and mix with apple for things.")
                ],
              ),
            ),
          ),
          SizedBox(
            width: AppMeasures.getSize(context).width * 0.02,
          ),
          const Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text("High Priority"), Text("5/2/23")],
            ),
          )
        ],
      ),
    );
  }
}
