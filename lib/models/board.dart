import 'dart:developer';

import 'column.dart';

/// Concerns data operations and intialisations only.
/// It should only contain raw data, and not unusal types.
/// getters and setter are built in (known properties)
class BoardModel {
  final List<ColumnModel> _columns = [];

  // Function belongs in Model, they only deal with raw data operations.
  void _add(ColumnModel newColumn) {
    _columns.add(newColumn);
  }

  void _remove(ColumnModel newColumn) {
    _columns.remove(newColumn);
  }
}

/// Acts as the mediator between the Model and the View, extends functions.
class BoardViewModel {
  final BoardModel _boardModel;

  BoardViewModel(this._boardModel);

  List<ColumnModel> get retriveColumns => _boardModel._columns;
  List<ColumnModel> columns() => retriveColumns;

  void onAdd(ColumnModel newColumn) {
    _boardModel._add(newColumn);
    log("Added new Column: $newColumn.name");
  }

  void onRemove(ColumnModel column) {
    _boardModel._remove(column);
    log("Removed Column: $column.name");
  }
}
