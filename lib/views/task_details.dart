import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:project_rain/models/task.dart';

class TaskDetails extends StatelessWidget {
  TaskDetails({
    super.key,
    required this.title,
    required this.taskDescription,
    required this.taskName,
  });

  final String title;
  final String taskDescription;
  final String taskName;

  final TaskDetailsController detailsController = Get.put(
    TaskDetailsController(),
  );

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            detailsController.toggleDetails();
          },
          child: SizedBox(
            width: double.maxFinite,
            height: double.maxFinite,
            child: ColoredBox(color: const Color.fromARGB(180, 0, 0, 0)),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: 500,
              maxWidth: 600,
              minHeight: 300,
              maxHeight: 400,
            ),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              height: MediaQuery.of(context).size.height * 0.4,
              child: Card(
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // --- Title ---
                      Row(
                        children: [
                          RichText(
                            text: TextSpan(
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 36,
                              ),
                              text: taskName,
                            ),
                          ),
                          Spacer(),
                          ElevatedButton(
                            onPressed: null,
                            child: Row(
                              children: [
                                Icon(Icons.edit),
                                Text("Edit", style: TextStyle(fontSize: 16)),
                              ],
                            ),
                          ),
                        ],
                      ),
                      // --- Tags ---
                      Padding(
                        padding: EdgeInsets.only(top: 15),
                        child: RichText(
                          text: TextSpan(
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            text: "Tags",
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 3),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(18),
                              child: Container(
                                alignment: Alignment.center,
                                width: 60,
                                height: 20,
                                color: Colors.blue,
                                child: Text(
                                  "Label 1",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      // --- Description ---
                      Padding(
                        padding: EdgeInsets.only(top: 15),
                        child: RichText(
                          text: TextSpan(
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            text: "Description",
                          ),
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          text: taskDescription,
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
