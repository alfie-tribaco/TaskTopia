import 'package:flutter/material.dart';
import 'package:tasktopia/app/config/theme/text_theme.dart';
import 'package:tasktopia/app/utils/constants/app_colors.dart';

class AppTheme {
  ThemeData lightTheme = ThemeData(
    textTheme: AppTextTheme().appTextTheme,
    colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primaryColor, background: AppColors.appWhite),
    useMaterial3: true,
  );

  ThemeData darkTheme = ThemeData(
    textTheme: AppTextTheme().appTextTheme,
    colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primaryColor, background: AppColors.appBlack),
    useMaterial3: true,
  );
}
