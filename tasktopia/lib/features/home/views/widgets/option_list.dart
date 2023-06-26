import 'package:flutter/material.dart';
import 'package:tasktopia/app/utils/constants/app_colors.dart';
import 'package:tasktopia/app/utils/constants/app_measures.dart';
import 'package:tasktopia/features/home/views/widgets/option_item.dart';

class OptionList extends StatefulWidget {
  const OptionList({super.key});

  @override
  State<OptionList> createState() => _OptionListState();
}

class _OptionListState extends State<OptionList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppMeasures().getSize(context).width,
      color: AppColors().appSecondaryWhite,
      height: 150,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            SizedBox(
              width: AppMeasures().getSize(context).width * 0.05,
            ),
            OptionItem(
                icon: Icon(
                  Icons.pets,
                  size: 35,
                  color: AppColors().appWhite,
                ),
                label: 'My Pet'),
            SizedBox(
              width: AppMeasures().getSize(context).width * 0.05,
            ),
            OptionItem(
                icon: Icon(
                  Icons.shop,
                  size: 35,
                  color: AppColors().appWhite,
                ),
                label: 'Shop'),
            SizedBox(
              width: AppMeasures().getSize(context).width * 0.05,
            ),
            OptionItem(
                icon: Icon(
                  Icons.emoji_events,
                  size: 35,
                  color: AppColors().appWhite,
                ),
                label: 'Achievements'),
            SizedBox(
              width: AppMeasures().getSize(context).width * 0.05,
            ),
            OptionItem(
                icon: Icon(
                  Icons.settings,
                  size: 35,
                  color: AppColors().appWhite,
                ),
                label: 'Settings'),
            SizedBox(
              width: AppMeasures().getSize(context).width * 0.05,
            ),
          ],
        ),
      ),
    );
  }
}
