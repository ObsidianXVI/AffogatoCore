part of affogato_core;

enum DeltaType {
  insert,
  replace,
  delete,
}

class Delta {
  final DeltaType deltaType;
  final CursorLocation start;
  final CursorLocation end;
  final String newContent;

  const Delta({
    required this.deltaType,
    required this.start,
    required this.end,
    required this.newContent,
  });
}
