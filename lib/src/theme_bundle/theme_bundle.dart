part of affogato_core;

class ThemeBundle<R extends RenderToken, S extends SyntaxHighlighter<R>> {
  final S synaxHighlighter;

  const ThemeBundle({
    required this.synaxHighlighter,
  });
}
