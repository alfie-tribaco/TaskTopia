import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:tasktopia/app/utils/helper/duration_helper.dart';
import 'package:tasktopia/app/utils/helper/panel_helper.dart';
import 'package:tasktopia/app/utils/helper/task_helper.dart';
import 'package:tasktopia/app/utils/shared/functions/app_theme_toggle.dart';

class AppProviders {
  List<SingleChildWidget> listOfProviders = [
    ChangeNotifierProvider(create: (_) => AppThemeToggle()),
    ChangeNotifierProvider(create: (_) => PanelHelper()),
    ChangeNotifierProvider(create: (_) => DurationHelper()),
    ChangeNotifierProvider(create: (_) => CurrentTaskHelper()),
  ];
}
