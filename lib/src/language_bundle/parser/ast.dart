part of affogato_core;

class AST {
  final List<ASTNode> nodes;

  AST({required this.nodes});
}

abstract class ASTNode {
  final String name;
  final List<String> scopes;
  final List<Token> tokens = [];

  ASTNode(this.name, {required this.scopes});

  String get lexeme => [for (final tok in tokens) tok.lexeme].join();

  String toPrettyString([int indent = 1]) =>
      "|- $name ${tokens.first.start}..${tokens.last.end} [${[
        for (final tok in tokens) tok.lexeme
      ].join(', ')}]";
}
