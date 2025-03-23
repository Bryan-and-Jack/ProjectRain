import 'package:flutter/material.dart';

// IMPORTANT: Change the home: paramater in main.dart to switch screens!

const String _taskName = "Task Name";
const String _taskDescription =
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum erat felis, porta ac facilisis pellentesque, lobortis vel risus. Curabitur congue finibus mi. Aliquam aliquet eget nibh vel volutpat.";

class TaskDetails extends StatefulWidget {
  const TaskDetails({super.key});
  @override
  _BoardViewState createState() => _BoardViewState();
}

class _BoardViewState extends State<TaskDetails> {
  String title = "Project Rain";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
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
                            style: TextStyle(color: Colors.black, fontSize: 36),
                            text: _taskName,
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
                        text: _taskDescription,
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
    );
  }
}
