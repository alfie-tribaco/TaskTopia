import 'package:flutter/material.dart';
import 'package:tasktopia/app/utils/shared/widgets/app_bar.dart';
import 'package:tasktopia/features/home/views/widgets/current_task.dart';
import 'package:tasktopia/features/home/views/widgets/option_list.dart';
import 'package:tasktopia/features/home/views/widgets/task_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(),
        body: Column(
          children: [OptionList(), CurrentTask(), TaskList()],
        ),
      ),
    );
  }
}
