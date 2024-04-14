import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list_app/view_models/app_view_model.dart';

class TaskListView extends StatelessWidget {
  TaskListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppViewModel>(
      builder: (context, viewModel, child) {
        return Container(
            decoration: BoxDecoration(
                color: viewModel.clrlvl2,
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(30))),
            //listview.separated helps us to form separated list view items, since we dont want all our tasks clogged up
            child: ListView.separated(
                padding: const EdgeInsets.all(
                    15), //this is to provide a better UI to the application
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height:
                        15, // this is the amount of separation between the tasks on the screen
                  );
                },
                itemCount: viewModel
                    .numTasks, //if  we have an item count, we're going to need an item builder
                itemBuilder: (context, index) {
                  // now what we want to do is make these tasks dismissible, so we're going to wrap them in a new widget called dismissable

                  return Dismissible(
                    //now the tasks can be slided away, but we also need  to delete them from our viewmodel index
                    key: UniqueKey(),
                    onDismissed: (direction) {
                      viewModel.deleteTask(
                          index); //now this will actually remove the task from the list of tasks
                    },
                    background: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                          color: Colors.red.shade300,
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                          child:
                              Icon(Icons.delete, color: Colors.red.shade700)),
                    ),
                    child: Container(
                      // we wrapped our listtiles with a container so they appear in separate boxes with a border
                      decoration: BoxDecoration(
                          color: viewModel.clrlvl1,
                          borderRadius: BorderRadius.circular(20)),
                      child: ListTile(
                        leading: Checkbox(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          side: BorderSide(width: 2, color: viewModel.clrlvl3),
                          checkColor: viewModel
                              .clrlvl1, //for when the checkbox is checked
                          activeColor:
                              viewModel.clrlvl3, // for when it is active
                          value: viewModel.getTaskValue(index),
                          onChanged: (value) {
                            viewModel.setTaskValue(
                                index, value!); //its a noble type
                          },
                        ),
                        title: Text(
                          viewModel.getTaskTitle(index),
                          style: TextStyle(
                              color: viewModel.clrlvl4,
                              fontSize: 17,
                              fontWeight: FontWeight.w500),
                        ), //this will now display all the added tasks, next to their checkboxes
                      ),
                    ),
                  );
                }));
      },
    );
  }
}
// now the list view is complete and functional, we shall now be working on the header view and the indicator view
