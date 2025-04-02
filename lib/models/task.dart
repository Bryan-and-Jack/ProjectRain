import "dart:developer";
import "package:get/get.dart";

import "column.dart";
import "tag.dart";

class TaskModel {
  TaskModel({required this.ID, required this.taskName, required this.index});
  int? ID;
  int? index;
  String taskName = "New Task";
  String taskDescription = "Description";
  ColumnViewModel? columnParent;
  final List<Tag> _tags = [];

  void _add(Tag newTag) {
    _tags.add(newTag);
  }

  void _remove(Tag tag) {
    _tags.remove(tag);
  }
}

class TaskDetailsController extends GetxController {
  var isEnabled = false.obs;

  void toggleDetails() {
    isEnabled.value = !isEnabled.value;
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
