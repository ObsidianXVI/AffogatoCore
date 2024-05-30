part of affogato_core;

class AST {
  final List<ASTNode> nodes;

  const AST({required this.nodes});
}

abstract class ASTNode {
  final String name;
  final List<Token> tokens = [];

  ASTNode(this.name);

  String toPrettyString([int indent = 1]) =>
      "|- $name ${tokens.first.start}..${tokens.last.end} [${[
        for (final tok in tokens) tok.lexeme
      ].join(', ')}]";
}
