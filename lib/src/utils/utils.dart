part of affogato_core;

class CursorLocation {
  final int rowNum;
  final int colNum;

  const CursorLocation({
    required this.rowNum,
    required this.colNum,
  });
}

extension StringUtils on String {
  List<String> get chars => split('');
}
