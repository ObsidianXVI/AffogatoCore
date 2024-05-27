part of affogato_core;

class CursorLocation {
  final int rowNum;
  final int colNum;

  const CursorLocation({
    required this.rowNum,
    required this.colNum,
  });

  @override
  bool operator ==(Object other) =>
      other is CursorLocation &&
      (rowNum == other.rowNum && colNum == other.colNum);

  bool operator <(CursorLocation other) =>
      rowNum < other.rowNum ||
      (rowNum == other.rowNum && colNum < other.colNum);

  bool operator >(CursorLocation other) =>
      rowNum > other.rowNum ||
      (rowNum == other.rowNum && colNum > other.colNum);

  bool operator <=(CursorLocation other) => (this < other) || (this == other);
  bool operator >=(CursorLocation other) => (this > other) || (this == other);
}

extension StringUtils on String {
  List<String> get chars => split('');
}
