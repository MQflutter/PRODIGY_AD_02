import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list_app/view/bottom_sheets/add_task_bottom_sheet_view.dart';
import 'package:to_do_list_app/view_models/app_view_model.dart';

class AddTaskView extends StatelessWidget {
  const AddTaskView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppViewModel>(builder: (context, viewModel, child) {
      return SizedBox(
          height: 60,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: viewModel.clrlvl3,
                  foregroundColor: viewModel.clrlvl1,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
              onPressed: () {
                HapticFeedback.heavyImpact();
                viewModel.bottomSheetBuilder(const AddTaskBottomSheetView(),
                    context); //this will create a default white bottom sheet that extends to the mid of the screen
              },
              child: const Icon(Icons.add, size: 30)));
    });
  }
}
