import 'package:flutter/material.dart';
import 'package:to_do_list_app/view/add_task_view.dart';
import 'package:to_do_list_app/view/header_view.dart';
import 'package:to_do_list_app/view/task_info.dart';
import 'package:to_do_list_app/view/task_list_view.dart';

class TaskPage extends StatelessWidget {
  TaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    //
    return Scaffold(
        body: SafeArea(
          /*we wrap our widget in safearea so that if there is a notch on top of the screen
       as in the case of latest phone models, the app screen doesnt appear in the notch-but below it, it also avoids the device buttons space in the bottom*/
          bottom:
              false, // we declare bottom as false, so now the app shall occupy the bottom space

          child: Column(
            //we now have a column widget with 3 children
            children: [
              //header view- displays the header details

              Expanded(
                  //these children are all expanded widgets so that the application is scalable to all devices
                  flex:
                      1, //the flex value is the ratio of how much of the total screen shall this widget occupy
                  child: HeaderView()),

              //task info view, displays the task info, how many to-do etc
              Expanded(flex: 1, child: TaskInfoView()),

              //task list view- displays the actual tasks
              Expanded(flex: 7, child: TaskListView()),
            ],
          ),
        ),
        floatingActionButton: const AddTaskView());
  }
}
