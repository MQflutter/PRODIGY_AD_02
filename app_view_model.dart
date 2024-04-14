// we'll only have one view model for our application, since it is a simple app
import 'package:flutter/material.dart';
import 'package:to_do_list_app/models/task_model.dart';
import 'package:to_do_list_app/models/user_model.dart';

class AppViewModel extends ChangeNotifier {
  // here we'll create a list of tasks to keep track of all the tasks in our application
  List<Task> tasks = <Task>[]; // this is where our tasks will be stored
  User user =
      User('John Snow'); // for the time being we'll give a username ourselves
// what this does is that it puts all our application colors in a single spot, we can conveniently change or update them from here
  Color clrlvl1 = Colors.grey.shade50;
  Color clrlvl2 = Colors.grey.shade200;
  Color clrlvl3 = Colors.grey.shade800;
  Color clrlvl4 = Colors.grey.shade900;

  int get numTasks => tasks
      .length; //now we have a reference to the number of tasks we have inside our viewmodel

  int get numTasksRemaining => tasks.where(
      // this shall tell us about the tasks that are not complete and hence, remaining
      (task) => !task.complete).length;

  void addTask(Task newTask) {
    tasks.add(newTask);
    notifyListeners(); //since it is wrapped with providers, all widgets will automatically update
  }

  bool getTaskValue(int taskIndex) {
    return tasks[taskIndex].complete;
  }

  void setTaskValue(int taskIndex, bool taskValue) {
    tasks[taskIndex].complete =
        taskValue; //this notifies the taskindex as to how many tasks are completed etc, we also need notifylisteners here
    notifyListeners();
  }

  String getTaskTitle(int taskIndex) {
    return tasks[taskIndex].title;
  }

  void deleteTask(int taskIndex) {
    tasks.removeAt(taskIndex);
    notifyListeners(); //since we're updating the data
  }

  void deleteCompletedTasks() {
    tasks = tasks.where((task) => !task.complete).toList();
    notifyListeners(); // this function says that any task that isn't complete is going to be here, so this means all the completed tasks shall automatically be deleted
  }

  void deleteAllTasks() {
    tasks.clear();
    notifyListeners();
  }

  void updateUsername(String username) {
    //this implements the settings function, we can change the username through this
    user.username = username;
    notifyListeners();
  }

  String get username => user.username;

  void bottomSheetBuilder(Widget bottomSheetView, BuildContext context)

  //we are doing it this way so the shape that we're creating on our bottom sheet remains consistent wherever we use it
  //this is basically a reusable way of creating a styled bottom sheet
  {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(40)), //it also needs a clip behaviour
        clipBehavior: Clip.antiAliasWithSaveLayer,
        context: context,
        builder: ((context) {
          return bottomSheetView;
        }));
  }
}
