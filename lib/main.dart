import 'package:flutter/material.dart';
import 'package:project_rain/views/column_view.dart';

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
      home: ColumnView(), //CHANGE THIS FOR DEBUGGING (ColumnView / TaskDetails)
    );
  }
}
