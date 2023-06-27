import 'package:flutter/material.dart';
import 'package:tasktopia/app/utils/constants/app_colors.dart';
import 'package:tasktopia/app/utils/shared/widgets/app_bar.dart';
import 'package:tasktopia/features/home/views/widgets/current_task.dart';
import 'package:tasktopia/features/home/views/widgets/option_list.dart';
import 'package:tasktopia/features/home/views/widgets/task_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: AppColors.primaryColor,
        ),
        appBar: const CustomAppBar(),
        body: const Column(
          children: [OptionList(), CurrentTask(), TaskList()],
        ),
      ),
    );
  }
}
