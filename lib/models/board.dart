import 'dart:developer';

import 'column.dart';

/// Concerns data operations and intialisations only.
/// It should only contain raw data, and not unusal types.
/// getters and setter are built in (known properties)
class BoardModel {
  final List<GroupModel> _columns = [];

  // Function belongs in Model, they only deal with raw data operations.
  void _add(GroupModel newColumn) {
    _columns.add(newColumn);
  }

  void _remove(GroupModel newColumn) {
    _columns.remove(newColumn);
  }
}

/// Acts as the mediator between the Model and the View, extends functions.
class BoardViewModel {
  final BoardModel _boardModel;

  BoardViewModel(this._boardModel);

  List<GroupModel> get retrieveColumns => _boardModel._columns;
  List<GroupModel> columns() => retrieveColumns;

  void onAdd(GroupModel newColumn) {
    _boardModel._add(newColumn);
    log("Added new Column: $newColumn.name");
  }

  void onRemove(GroupModel column) {
    _boardModel._remove(column);
    log("Removed Column: $column.name");
  }
}
