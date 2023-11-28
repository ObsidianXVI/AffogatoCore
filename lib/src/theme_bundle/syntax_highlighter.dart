part of affogato_core;

abstract class SynaxHighlighter {
  List<RenderToken<T>> createRenderTokens<T>(AST ast);
}
