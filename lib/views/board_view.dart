import 'package:flutter/material.dart';

class BoardView extends StatefulWidget {
  @override
  _BoardViewState createState() => _BoardViewState();
}

class _BoardViewState extends State<BoardView> {
  String title = "Project Rain";

  var list = [
    "To-Do",
    "In-Progress",
    "Done",
    "Column 4",
    "Column 5",
    "Column 6",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Title of the Project',
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
                for (var i = 0; i < list.length; i++)
                  Padding(
                    padding:
                        i == list.length - 1
                            ? EdgeInsets.zero
                            : EdgeInsets.only(right: 67),
                    child: Container(
                      color: Colors.grey,
                      width: 420,
                      // Column for reference, will be removed
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [Text(list[i])],
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
