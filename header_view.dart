import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list_app/view/bottom_sheets/delete_bottom_sheet_view.dart';
import 'package:to_do_list_app/view/bottom_sheets/settings_bottom_sheet_view.dart';
import 'package:to_do_list_app/view_models/app_view_model.dart';

class HeaderView extends StatelessWidget {
  const HeaderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppViewModel>(
      builder: (context, viewModel, child) {
        return Row(children: [
          Expanded(
              flex: 3,
              child: Container(
                margin: EdgeInsets.only(left: 15),
                child: Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: FittedBox(
                          fit: BoxFit.fitHeight,
                          child: Text(
                            "Welcome Back",
                            style: TextStyle(
                                fontSize: 23,
                                fontWeight: FontWeight.w400,
                                color: viewModel.clrlvl4),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: FittedBox(
                          fit: BoxFit.fitHeight,
                          child: Text(
                            viewModel.username,
                            style: TextStyle(
                                fontSize: 42,
                                fontWeight: FontWeight.bold,
                                color: viewModel.clrlvl4),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )),
          Expanded(
            flex: 1,
            child: InkWell(
              onTap: () {
                viewModel.bottomSheetBuilder(DeleteBottomSheetView(), context);
              },
              child: Icon(
                Icons.delete,
                color: viewModel.clrlvl3,
                size: 40,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: InkWell(
                onTap: () {
                  //this is one of the benefits of the mvvm model, we can easily reuse our bottom sheets etc

                  viewModel.bottomSheetBuilder(
                      SettingsBottomSheetView(), context);
                },
                child: Icon(
                  Icons.settings,
                  color: viewModel.clrlvl3,
                  size: 40,
                )),
          )
        ]);
      },
    );
  }
}
