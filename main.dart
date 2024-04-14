import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list_app/view/task_page.dart';
import 'package:to_do_list_app/view_models/app_view_model.dart';

void main() {
  // we wrap our widget with a changenotifierprovider to use the notifier API
  runApp(ChangeNotifierProvider(
      create: (context) => AppViewModel(), child: const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TaskPage(), //we import our task page file into home
    );
  }
}
