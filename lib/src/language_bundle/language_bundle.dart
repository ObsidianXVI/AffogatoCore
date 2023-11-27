part of affogato_core;

class LanguageBundle {
  final Tokeniser tokeniser;
  final Parser parser;
  final Interpreter interpreter;

  const LanguageBundle({
    required this.tokeniser,
    required this.parser,
    required this.interpreter,
  });
}
