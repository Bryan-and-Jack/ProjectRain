//.

class ColumnModel {
  String name = "New Column";
  int index = -1; // -1 means NOT on the board.
}

class ColumnModelView {
  final ColumnModel _columnModel;

  ColumnModelView(this._columnModel); // Passes the object as parameter.

  ColumnModel toModel() => _columnModel; // When called, returns original Model.
}
