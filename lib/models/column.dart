import 'dart:developer';

import 'task.dart';

class ColumnModel {
  ColumnModel({required this.ID, required this.name, required this.index});
  int? ID;
  int? index;
  String name = "New Column";
  final List<TaskModel> _tasks = [];

  void _add(TaskModel newTask) {
    _tasks.add(newTask);
  }

  void _remove(TaskModel newTask) {
    _tasks.remove(newTask);
  }

  void _updateName(String newName) {
    name = newName;
  }

  void _updateIndex(int newIndex) {
    index = newIndex;
  }
}

class ColumnViewModel {
  final ColumnModel _columnModel;

  ColumnViewModel(this._columnModel);

  List<TaskModel> get retriveTasks => _columnModel._tasks;
  List<TaskModel> tasks() => retriveTasks;

  void onAdd(TaskModel newTask) {
    _columnModel._add(newTask);
    log("$newTask.name added");
  }

  void onRemove(TaskModel task) {
    _columnModel._remove(task);
    log("$task.name deleted");
  }

  void onUpdateName(String newName) {
    _columnModel._updateName(newName);
    log("Name updated: $newName.name");
  }

  void onUpdateIndex(int newIndex) {
    _columnModel._updateIndex(newIndex);
    log("Index updated: $newIndex.name");
  }
}
