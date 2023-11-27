part of affogato_core;

enum TokenType { eof }

class Token {
  final CursorLocation start;
  final CursorLocation end;
  final String lexeme;
  final TokenType tokenType;
  final Object? literal;

  const Token({
    required this.tokenType,
    required this.lexeme,
    required this.start,
    required this.end,
    this.literal,
  });
}
