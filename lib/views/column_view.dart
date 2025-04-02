import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:project_rain/models/task.dart';
import 'package:project_rain/views/task_view.dart';
import 'package:project_rain/views/task_details.dart';

//  Debugging values (waiting to be implmented inside Column logic)
const double _columnWidth = 420; // Debug for responsiveness!
const double _taskVerticalSpacing = 5;

class ColumnView extends StatefulWidget {
  const ColumnView({super.key});
  @override
  BoardViewState createState() => BoardViewState();
}

class BoardViewState extends State<ColumnView> {
  final String _debugTitle = "Project Rain";
  final String _debugTaskName = "Task Name";
  final String _debugTaskDescription =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum erat felis, porta ac facilisis pellentesque, lobortis vel risus. Curabitur congue finibus mi. Aliquam aliquet eget nibh vel volutpat.";

  final TaskDetailsController detailsController = Get.put(
    TaskDetailsController(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(left: 50, right: 50, bottom: 30),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.zero,
                  child: Container(
                    color: const Color.fromARGB(255, 225, 225, 225),
                    width: _columnWidth,
                    child: ListView(
                      children: [
                        Container(
                          margin: EdgeInsets.all(8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("PLACEHOLDER COLUMN"),
                              Icon(Icons.drag_indicator),
                            ],
                          ),
                        ),
                        ListedTask(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Obx(
            () =>
                detailsController.isEnabled.value
                    ? TaskDetails(
                      title: _debugTitle,
                      taskDescription: _debugTaskDescription,
                      taskName: _debugTaskName,
                    )
                    : Text("Disabled"),
          ),
        ],
      ),
    );
  }
}
