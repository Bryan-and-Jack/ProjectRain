import 'package:flutter/material.dart';
import 'views/task_details.dart'; // ignore warning for debugging
import 'views/task_view.dart'; // ignore warning for debugging

// IMPORTANT: Change the home: paramater in main.dart to switch screens!

void main() {
  runApp(MyApp());
}

// Placeholder, used for running the program and nothing else!!!
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Project Rain', //Seems to only be used in mobile (Android).
      theme: ThemeData(appBarTheme: AppBarTheme(toolbarHeight: 100)),
      home: ColumnView(), //CHANGE THIS FOR DEBUGGING (ColumnView / TaskDetails)
    );
  }
}
