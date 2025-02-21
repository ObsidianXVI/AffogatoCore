part of affogato_core;

/// This is what the type generics mean:
/// - [R] is the type of [RenderToken] being generated
/// - hence, the [SyntaxHighlighter] also must produce render tokens of type [R], and this syntax highlighter will be a type [S]
/// - [C] represents the colour class being used. On Flutter, this should be [Color]
/// - [Y] represents the text styling class being used. On Flutter, this should be [TextStyle]
/// - The [EditorTheme] should therefore represent colours with [C] and text styles with [Y]
class ThemeBundle<R extends RenderToken, S extends SyntaxHighlighter<R>, C, Y> {
  final S synaxHighlighter;
  final EditorTheme<C, Y> editorTheme;

  const ThemeBundle({
    required this.synaxHighlighter,
    required this.editorTheme,
  });
}
