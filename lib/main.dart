import 'package:flutter/material.dart';
import 'views/task_details.dart';

// IMPORTANT: Change the home: paramater in main.dart to switch screens!

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Project Rain', // Seems to only be used in mobile (Android).
      theme: ThemeData(appBarTheme: AppBarTheme(toolbarHeight: 100)),
      home:
          TaskDetails(), //CHANGE THIS FOR DEBUGGING (ColumnView / TaskDetails)
    );
  }
}
