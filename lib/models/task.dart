import "column.dart";
import "tag.dart";

/// Concerns data operations and intialisations only.
class TaskModel {
  TaskModel({
    required this.id,
    required this.taskName,
    required this.indexOfTask,
  });
  int? id;
  int? indexOfTask;
  String taskName = "New Task";
  String taskDescription = "Description";
  ColumnViewModel? columnParent;
  final List<Tag> _taskTags = [];

  void _add(Tag newTag) {
    _taskTags.add(newTag);
  }

  void _remove(Tag tag) {
    _taskTags.remove(tag);
  }
}

/// Acts as the mediator between the Model and the View, extends functions.
class TaskViewModel {
  final TaskModel _taskModel;

  TaskViewModel(this._taskModel);

  List<Tag> get taskTags => _taskModel._taskTags;
  List<Tag> getTaskTagsItems() => taskTags;

  void onAddTask(Tag newTag) {
    _taskModel._add(newTag);
  }

  void onRemoveTask(Tag tag) {
    _taskModel._remove(tag);
  }
}
