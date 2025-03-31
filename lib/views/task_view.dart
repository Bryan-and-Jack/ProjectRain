import 'dart:developer';
import 'package:flutter/material.dart';

const double _taskVerticalSpacing = 5;

class ListedTask extends StatelessWidget {
  ListedTask({super.key});
  final String title = "Project Rain";
  final tasks = ["Task 1", "Task 2", "Task 3"];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: double.infinity,
      child: GestureDetector(
        onTap: () {
          log("sup");
        },
        child: Card(
          margin: EdgeInsets.only(
            top: _taskVerticalSpacing,
            bottom: _taskVerticalSpacing,
            left: 30,
            right: 30,
          ),
          color: const Color.fromARGB(255, 255, 255, 255),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(right: 15),
                child: Icon(Icons.drag_indicator),
              ),
              Text("ht"),
              Spacer(),
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
                child: SizedBox(
                  width: 12,
                  height: double.infinity,
                  child: ColoredBox(color: Colors.blue),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
