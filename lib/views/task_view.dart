import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:project_rain/models/task.dart';

class ListedTask extends StatelessWidget {
  ListedTask({super.key});

  final TaskDetailsController detailsController = Get.put(
    TaskDetailsController(),
  );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: double.infinity,
      child: GestureDetector(
        onTap: () {
          detailsController.toggleDetails();
        },
        child: Card(
          margin: EdgeInsets.only(top: 5, bottom: 5, left: 30, right: 30),
          color: const Color.fromARGB(255, 255, 255, 255),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(right: 15),
                child: Icon(Icons.drag_indicator),
              ),
              Text("New Task"),
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
