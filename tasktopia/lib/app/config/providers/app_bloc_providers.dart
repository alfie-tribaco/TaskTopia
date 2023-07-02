import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/single_child_widget.dart';
import 'package:tasktopia/features/home/bloc/habit_bloc.dart';
import 'package:tasktopia/features/home/bloc/habit_state.dart';
import 'package:tasktopia/features/home/bloc/reminder_bloc.dart';
import 'package:tasktopia/features/home/bloc/reminder_state.dart';
import 'package:tasktopia/features/home/bloc/task_bloc.dart';
import 'package:tasktopia/features/home/bloc/task_state.dart';

class AppBlocProviders {
  List<SingleChildWidget> listOfBlocProviders = [
    BlocProvider(create: (BuildContext context) => TaskBloc(InitTaskState())),
    BlocProvider(create: (BuildContext context) => HabitBloc(InitHabitState())),
    BlocProvider(
        create: (BuildContext context) => ReminderBloc(InitReminderState())),
  ];
}
