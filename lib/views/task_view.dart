import 'package:flutter/material.dart';

// IMPORTANT: Change the home: paramater in main.dart to switch screens!

//  Debugging values
const double _columnWidth = 420;
const double _taskVerticalSpacing = 5;

class ColumnView extends StatefulWidget {
  const ColumnView({super.key});
  @override
  BoardViewState createState() => BoardViewState();
}

class BoardViewState extends State<ColumnView> {
  String title = "Project Rain";

  var tasks = ["Task 1", "Task 2", "Task 3"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(left: 50, right: 50, bottom: 30),
        child: Row(
          children: [
            // --- Column --- (!! FOR DEMO ONLY - PLEASE IGNORE !!)
            //for column view code, refer to "Column View" task instead!)
            Padding(
              padding: EdgeInsets.zero,
              child: Container(
                color: const Color.fromARGB(255, 226, 229, 236),
                width: _columnWidth,
                child: ListView(
                  children: [
                    Container(
                      margin: EdgeInsets.all(8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      ),
                    ),

                    // --- Task ---
                    for (int i = 0; i < tasks.length; i++)
                      SizedBox(
                        height: 60,
                        width: double.infinity,
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
                              Text(tasks[i]),
                              Spacer(),

                              // Here's a Placeholder conditional statement for debugging the tags.
                              if (i.isOdd)
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
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
