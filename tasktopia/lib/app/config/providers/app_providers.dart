import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:tasktopia/app/utils/shared/functions/app_theme_toggle.dart';

class AppProviders {
  List<SingleChildWidget> listOfProviders = [
    ChangeNotifierProvider(create: (_) => AppThemeToggle()),
  ];
}
