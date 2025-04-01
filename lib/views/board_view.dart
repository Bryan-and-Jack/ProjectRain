import 'package:flutter/material.dart';
import 'package:project_rain/models/column.dart';
import '../views/column_view.dart';
import 'package:get/get.dart';

class BoardView extends StatefulWidget {
  const BoardView({super.key});

  @override
  BoardViewState createState() => BoardViewState();
}

class BoardViewState extends State<BoardView> {
  // Provisional variables
  String title = "Project Rain";
  int delimiter = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: TextStyle(fontSize: 35, fontWeight: FontWeight.w600),
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(left: 50, right: 50, bottom: 30),
        child: Scrollbar(
          thumbVisibility: true,
          // interactive: true, // Controller is required to attach ScrollPosition (making the scrollbar draggable). Scrollbar and SinglechildScrollView need the same controller
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                for (var i = 0; i < delimiter; i++)
                  Padding(
                    padding:
                        i == delimiter - 1
                            ? EdgeInsets.zero
                            : EdgeInsets.only(right: 67),
                    child: Container(
                      color: Colors.grey,
                      width: 420,
                      child: Group(
                        // title: 'My Column'.obs,
                        taskWidth: 420,
                        taskHeight: 35,
                        verticalGap: 8,
                        group: GroupModel(
                          ID: 1,
                          name: 'The Group'.obs,
                          index: 1.obs,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  blurRadius: 6,
                  spreadRadius: 3,
                  offset: Offset(2, 4),
                ),
              ],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                SizedBox(
                  width: 150,
                  child: TextButton(
                    onPressed: null,
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                        ),
                      ),
                    ),
                    child: Text('New Task'),
                  ),
                ),
                SizedBox(
                  width: 150,
                  child: TextButton(
                    onPressed: null,
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                      ),
                    ),
                    child: Text('New Column'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
