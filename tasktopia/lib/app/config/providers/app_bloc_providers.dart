import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/single_child_widget.dart';
import 'package:tasktopia/features/home/bloc/task_bloc.dart';
import 'package:tasktopia/features/home/bloc/task_state.dart';

class AppBlocProviders {
  List<SingleChildWidget> listOfBlocProviders = [
    BlocProvider(create: (BuildContext context) => TaskBloc(InitTaskState())),
  ];
}
