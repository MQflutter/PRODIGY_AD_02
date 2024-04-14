import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:to_do_list_app/view_models/app_view_model.dart';

class SettingsBottomSheetView extends StatelessWidget {
  const SettingsBottomSheetView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController entryController =
        TextEditingController(); // this keeps track of the text that we have inside of the text field

    return Consumer<AppViewModel>(
      builder: (context, viewModel, child) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            height: 80,
            child: Center(
              child: SizedBox(
                height: 40,
                width: 250,
                child: TextField(
                  onSubmitted: (value) {
                    if (entryController.text.isNotEmpty) {
                      viewModel.updateUsername(entryController.text);
                    }
                    Navigator.of(context)
                        .pop(); // this will pop the bottom sheet
                  },
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(bottom: 5),
                      filled: true,
                      fillColor: viewModel.clrlvl2,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                              width: 0, style: BorderStyle.none))),
                  textAlign: TextAlign.center,
                  textAlignVertical: TextAlignVertical.center,
                  cursorColor: viewModel.clrlvl4,
                  autofocus:
                      true, //the user won't have to manualy tap into the text field, it'll auto focus the control to start typing right away
                  autocorrect: false,
                  controller: entryController,
                  style: TextStyle(
                    color: viewModel.clrlvl4,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
