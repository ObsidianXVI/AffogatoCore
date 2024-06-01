part of affogato_core;

abstract class SyntaxHighlighter<T extends RenderToken> {
  List<T> createRenderTokens(AST ast);
}
