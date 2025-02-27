part of affogato_core;

class LanguageBundle {
  final String bundleName;
  final Tokeniser tokeniser;
  final Parser parser;
  final Interpreter interpreter;
  final List<String> fileAssociationContributions;

  const LanguageBundle({
    required this.bundleName,
    required this.tokeniser,
    required this.parser,
    required this.interpreter,
    required this.fileAssociationContributions,
  });
}
