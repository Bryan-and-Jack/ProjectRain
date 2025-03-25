import 'dart:developer';
import 'task.dart';

/// Should only contain raw data, and not unusal types.
/// getters and setter are built in (known properties)
class ColumnModel {
  int? id;
  String name = "New Column";
  int? index;
  final List<TaskModel> _tasks = [];

  ColumnModel({required this.id, required this.name, required this.index});

  void _add(TaskModel newTask) {
    _tasks.add(newTask);
  }

  void _remove(TaskModel newTask) {
    _tasks.remove(newTask);
  }

  // Function belongs in Model, they only deal with raw data operations.
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

  List<TaskModel> get tasks => _columnModel._tasks;
  List<TaskModel> taskList() => tasks;

  void onAdd(TaskModel newTask) {
    _columnModel._add(newTask);
    log("$newTask.name added");
  }

  void onRemove(TaskModel newTask) {
    _columnModel._remove(newTask);
    log("$newTask.name deleted");
  }

  void onUpdateName(String newName) {
    _columnModel._updateName(newName);
    log("Name updated");
  }

  void onUpdateIndex(int newIndex) {
    _columnModel._updateIndex(newIndex);
    log("Index updated");
  }
}
