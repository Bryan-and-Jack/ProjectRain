import 'package:flutter/material.dart';

//  Debugging values (waiting to be implmented inside Column logic)
const double _columnWidth = 420; // Debug for responsiveness!
const double _taskVerticalSpacing = 5;

class ColumnView extends StatefulWidget {
  const ColumnView({super.key});
  @override
  BoardViewState createState() => BoardViewState();
}

class BoardViewState extends State<ColumnView> {
  String title = "Project Rain";

  var tasks = [
    "hello",
    "hi",
    "sup",
  ]; // Debug tasks here, try putting in lots and testing scrolling.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(left: 50, right: 50, bottom: 30),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.zero,
              // IGNORE CODE ABOVE - FOR DEMO PURPOSE ONLY
              // ColumnView here..
              child: Container(
                color: const Color.fromARGB(255, 255, 125, 125),
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
                    for (int i = 0; i < tasks.length; i++)
                      Container(
                        margin: EdgeInsets.only(
                          top: _taskVerticalSpacing,
                          bottom: _taskVerticalSpacing,
                          left: 30,
                          right: 30,
                        ),
                        height: 50,
                        width: double.infinity,
                        color: const Color.fromARGB(255, 125, 255, 153),

                        // Placeholder name
                        alignment: Alignment.center,
                        child: Text(tasks[i]),
                      ),
                  ],
                ),
                // IGNORE CODE BELOW - FOR DEMO PURPOSE ONLY
              ),
            ),
          ],
        ),
      ),
    );
  }
}
