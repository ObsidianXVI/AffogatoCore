part of affogato_core;

class EditorTheme<C, Y> {
  final C windowColor;
  final C editorColor;
  final C borderColor;
  final C primaryBarColor;
  final C statusBarColor;
  final C defaultTextColor;
  final Y defaultTextStyle;

  const EditorTheme({
    required this.windowColor,
    required this.editorColor,
    required this.borderColor,
    required this.primaryBarColor,
    required this.statusBarColor,
    required this.defaultTextColor,
    required this.defaultTextStyle,
  });
}
