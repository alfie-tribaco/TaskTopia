import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasktopia/app/config/providers/app_providers.dart';
import 'package:tasktopia/app/config/theme/app_theme.dart';
import 'package:tasktopia/app/utils/constants/app_strings.dart';
import 'package:tasktopia/app/utils/shared/functions/app_theme_toggle.dart';
import 'package:tasktopia/features/home/views/screens/home_screen.dart';

void main() {
  runApp(MultiProvider(
      providers: AppProviders().listOfProviders, child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return Consumer<AppThemeToggle>(
      builder: (context, value, child) {
        return MaterialApp(
          title: AppStrings.appName,
          theme:
              value.isLightTheme ? AppTheme().lightTheme : AppTheme().darkTheme,
          home: const HomeScreen(),
        );
      },
    );
  }
}
