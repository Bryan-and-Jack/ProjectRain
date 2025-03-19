import 'package:flutter/material.dart';
import 'views/board_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Project Rain', //Seems to only be used in mobile (Android).
      theme: ThemeData(appBarTheme: AppBarTheme(toolbarHeight: 100)),
      home: BoardView(), //Home Screen
    );
  }
}
