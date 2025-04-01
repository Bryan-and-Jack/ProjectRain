import 'package:flutter/material.dart';
import '../models/column.dart';
import '../models/task.dart';
import 'package:get/get.dart';

class Group extends StatelessWidget {
  Group({
    super.key,
    required this.taskWidth,
    required this.taskHeight,
    required this.verticalGap,
    required this.group,
  });
  final GroupModel group;
  late final GroupViewModel viewModel = Get.put(GroupViewModel(group));
  double taskWidth;
  double taskHeight;
  double verticalGap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.zero,
        child: Container(
          color: Colors.grey,
          width: taskWidth,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Obx(() => Text(viewModel.name.value)),
                    Obx(() => Text(viewModel.index.value.toString())),
                    Icon(Icons.drag_indicator),
                  ],
                ),
              ),

              // buttons for testing only
              ElevatedButton(
                onPressed: () {
                  final newTask = TaskModel(
                    ID: DateTime.now().millisecondsSinceEpoch,
                    taskName: 'Task ${viewModel.tasks().length + 1}'.obs,
                    index: viewModel.tasks().length + 1,
                  );
                  viewModel.onAdd(newTask);
                },
                child: Text('Add Task'),
              ),

              ElevatedButton(
                onPressed: () {
                  viewModel.onUpdateName("Renamed");
                },
                child: Text('Change Name'),
              ),

              ElevatedButton(
                onPressed: () {
                  viewModel.onUpdateIndex(2);
                },
                child: Text('Change Index'),
              ),

              // List
              Expanded(
                child: Obx(() {
                  final tasks = viewModel.tasks();

                  return ListView.builder(
                    itemCount: tasks.length,
                    itemBuilder: (context, index) {
                      var task = tasks[index];
                      return Container(
                        margin: EdgeInsets.only(
                          top: verticalGap,
                          bottom: verticalGap,
                          left: 30,
                          right: 30,
                        ),
                        height: taskHeight,
                        width: double.infinity,
                        color: Color.fromARGB(255, 125, 255, 153),
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Obx(() => Text(task.taskName.value)),
                            IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () {
                                viewModel.onRemove(task);
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
