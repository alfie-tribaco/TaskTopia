import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:tasktopia/app/utils/constants/app_colors.dart';

class OptionItem extends StatelessWidget {
  const OptionItem({super.key, required this.icon, required this.label});

  final Icon icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 30),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                gradient: LinearGradient(colors: [
                  AppColors().primaryColor,
                  AppColors().gradientEnd
                ])),
            child: icon,
          ),
          Text(label)
        ],
      ),
    );
  }
}
