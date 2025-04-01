import "dart:developer";

import "column.dart";
import "tag.dart";
import 'package:get/get.dart';

class TaskModel {
  TaskModel({required this.ID, required this.taskName, required this.index});
  int? ID;
  int? index;
  RxString taskName = "New Task".obs;
  String taskDescription = "Description";
  GroupViewModel? columnParent;
  final List<Tag> _tags = [];

  void _add(Tag newTag) {
    _tags.add(newTag);
  }

  void _remove(Tag tag) {
    _tags.remove(tag);
  }
}

class TaskViewModel {
  final TaskModel _taskModel;

  TaskViewModel(this._taskModel);

  List<Tag> get retriveTags => _taskModel._tags;
  List<Tag> tags() => retriveTags;

  void onAdd(Tag newTag) {
    _taskModel._add(newTag);
    log("$newTag.name added");
  }

  void onRemove(Tag tag) {
    _taskModel._remove(tag);
    log("$tag.name removed");
  }
}
