import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';
import 'package:tasktopia/app/config/providers/app_bloc_providers.dart';
import 'package:tasktopia/app/config/providers/app_providers.dart';
import 'package:tasktopia/app/config/theme/app_theme.dart';
import 'package:tasktopia/app/utils/constants/app_strings.dart';
import 'package:tasktopia/app/utils/helper/permission_helper.dart';
import 'package:tasktopia/app/utils/shared/functions/app_theme_toggle.dart';
import 'package:tasktopia/features/home/views/screens/home_screen.dart';
import 'package:tasktopia/services/local_storage/local_database.dart';
import 'package:tasktopia/services/notification_service/local_notification.dart';
import 'package:timezone/data/latest.dart' as tz;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  LocalDatabase().openLocalDatabase();
  AppPermissionHandler().checkPermissionStatus();
  LocalNotificationApi().initLocalNotification();
  tz.initializeTimeZones();
  runApp(MultiBlocProvider(
    providers: AppBlocProviders().listOfBlocProviders,
    child: MultiProvider(
        providers: AppProviders().listOfProviders, child: const MyApp()),
  ));
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
