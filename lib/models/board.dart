import 'dart:developer';

import 'column.dart';

/// Concerns data operations and intialisations only.
class BoardModel {
  final List<ColumnModel> _columns = [];

  void _addColumn(ColumnModel newColumn) {
    _columns.add(newColumn);
  }

  void _removeColumn(ColumnModel newColumn) {
    _columns.remove(newColumn);
  }
}

/// Acts as the mediator between the Model and the View, extends functions.
class BoardViewModel {
  final BoardModel _boardModel;

  BoardViewModel(this._boardModel);

  List<ColumnModel> get columns => _boardModel._columns;

  List<ColumnModel> getColumnListItems() => columns;

  void onAddColumn(ColumnModel newColumn) {
    _boardModel._addColumn(newColumn);
    log("Added new Column: $newColumn.name");
  }

  void onRemoveColumn(ColumnModel newColumn) {
    _boardModel._removeColumn(newColumn);
    log("Removed Column: $newColumn.name");
  }
}
