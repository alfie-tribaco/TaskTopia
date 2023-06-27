import 'package:flutter/material.dart';
import 'package:tasktopia/app/utils/constants/app_colors.dart';
import 'package:tasktopia/app/utils/constants/app_measures.dart';
import 'package:tasktopia/features/home/views/widgets/task_card.dart';

class TaskList extends StatefulWidget {
  const TaskList({super.key});

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  late PageController pageController;
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      child: SizedBox(
        child: Column(
          children: [
            SizedBox(
              //Options
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        pageController.animateToPage(0,
                            duration: Duration(milliseconds: 500),
                            curve: Curves.easeIn);
                        currentPage = 0;
                      });
                    },
                    child: Container(
                      decoration: currentPage == 0
                          ? BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: AppColors().primaryColor,
                            )
                          : BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: AppColors().appWhite,
                              border: Border.all(
                                  color: AppColors().primaryColor, width: 3)),
                      height: 40,
                      width: AppMeasures().getSize(context).width * 0.28,
                      child: const Center(child: Text("Habits")),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        pageController.animateToPage(1,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeIn);
                        currentPage = 1;
                      });
                    },
                    child: Container(
                      decoration: currentPage == 1
                          ? BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: AppColors().primaryColor,
                            )
                          : BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: AppColors().appWhite,
                              border: Border.all(
                                  color: AppColors().primaryColor, width: 3)),
                      height: 40,
                      width: AppMeasures().getSize(context).width * 0.28,
                      child: const Center(child: Text("Daily Task")),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        pageController.animateToPage(2,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeIn);
                        currentPage = 2;
                      });
                    },
                    child: Container(
                      decoration: currentPage == 2
                          ? BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: AppColors().primaryColor,
                            )
                          : BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: AppColors().appWhite,
                              border: Border.all(
                                  color: AppColors().primaryColor, width: 3)),
                      height: 40,
                      width: AppMeasures().getSize(context).width * 0.28,
                      child: const Center(child: Text("Reminder")),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Daily Task",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  SizedBox(
                    child: Row(children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          color: AppColors().primaryColor,
                        ),
                        padding: const EdgeInsets.all(5),
                        child: Icon(
                          Icons.videogame_asset,
                          color: AppColors().appWhite,
                          size: 35,
                        ),
                      ),
                      SizedBox(
                          width: AppMeasures().getSize(context).width * 0.02),
                      Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          color: AppColors().primaryColor,
                        ),
                        child: Icon(
                          Icons.edit,
                          color: AppColors().appWhite,
                          size: 35,
                        ),
                      ),
                    ]),
                  )
                ],
              ),
            ),
            Divider(
              thickness: 2,
              color: AppColors().appBlack,
            ),
            const SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    Icons.sort,
                    size: 30,
                  )
                ],
              ),
            ),
            SizedBox(
              width: AppMeasures().getSize(context).width,
              height: AppMeasures().getSize(context).height * 0.3,
              child: PageView(controller: pageController, children: [
                ListView.builder(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return const TaskCard();
                  },
                ),
                Center(child: Text("Habits")),
                Center(child: Text("Reminder"))
              ]),
            )
          ],
        ),
      ),
    );
  }
}
