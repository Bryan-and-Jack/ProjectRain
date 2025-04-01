import 'dart:developer';
import 'package:get/get.dart';

import 'task.dart';

class GroupModel {
  GroupModel({required this.ID, required this.name, required this.index});
  int? ID;
  RxInt? index; // Perhaps this should be initialized as 0?
  RxString name = "New Group".obs;
  // final RxList<TaskModel> _tasks = <TaskModel>[].obs;
  final _tasks = <TaskModel>[].obs;

  void _add(TaskModel newTask) {
    _tasks.add(newTask);
  }

  void _remove(TaskModel task) {
    _tasks.remove(task);
  }

  void _updateName(String newName) {
    name.value = newName;
  }

  void _updateIndex(int newIndex) {
    index!.value = newIndex;
  }
}

class GroupViewModel extends GetxController {
  final GroupModel _groupModel;

  GroupViewModel(this._groupModel);

  RxList<TaskModel> get retrieveTasks => _groupModel._tasks;
  RxList<TaskModel> tasks() => retrieveTasks;
  RxString get name => _groupModel.name;
  // index getter might be needed for the dragging system
  RxInt get index => _groupModel.index!;

  void onAdd(TaskModel newTask) {
    _groupModel._add(newTask);
    log("$newTask.name added");
  }

  void onRemove(TaskModel task) {
    _groupModel._remove(task);
    log("$task.name deleted");
  }

  void onUpdateName(String newName) {
    _groupModel._updateName(newName);
    log("Name updated: $newName");
  }

  void onUpdateIndex(int newIndex) {
    _groupModel._updateIndex(newIndex);
    log("Index updated: $newIndex.name");
  }
}
