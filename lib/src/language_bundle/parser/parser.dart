part of affogato_core;

abstract class Parser {
  ParseResult parse(List<Token> tokens);
}

class ParseResult {
  final AST ast = AST(nodes: []);
}
