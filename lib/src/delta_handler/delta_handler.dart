part of affogato_core;

class DeltaHandler {
  final AffogatoDocument document;
  final LanguageBundle languageBundle;
  final ThemeBundle themeBundle;
  final List<Token> tokens = [];
  late final AST ast;

  DeltaHandler({
    required this.document,
    required this.languageBundle,
    required this.themeBundle,
  });

  List<RenderToken> handleDelta(Delta delta) {
    final int diffStartIndex =
        tokens.lastIndexWhere((Token t) => t.end < delta.start);
    final int diffEndIndex =
        tokens.indexWhere((Token t) => t.start > delta.end);
    final List<Token> staleTokens =
        tokens.sublist(diffStartIndex + 1, diffEndIndex);

    return themeBundle.synaxHighlighter.createRenderTokens(
      languageBundle.parser.parse(
        languageBundle.tokeniser.tokenise(
          'interpolate(staleTokens, delta)',
          precedingTokens: [],
          succeedingTokens: [],
        ),
      ),
    );
  }

  /* /// Merge a list of stale [Token]s with the new content in the [Delta],
  /// assuming the [staleTokens] are sorted in ascending order.
  String interpolate(List<Token> staleTokens, Delta delta) {
    if (delta.deltaType == DeltaType.insert) {
      // For DeltaType.insert, the Delta.start is the Token.end of the token
      // after which the text is to be inserted
      final int startIndex =
          staleTokens.indexWhere((Token t) => t.end == delta.start);
      // Flatten the preceding tokens, insert the delta, flatten the succeeding
      // tokens
      return staleTokens.sublist(startIndex).flatten() +
          delta.newContent +
          staleTokens.sublist(startIndex, staleTokens.length).flatten();
    } else if (delta.deltaType == DeltaType.delete) {
      // For DeltaType.delete, the Delta.start is the CursorLocation of the character
      // the cursor was initially on. The Delta.end is the CursorLocation of the
      // last character to be deleted
      final List<String> newTokens = [];
      final int startIndex =
          staleTokens.indexWhere((Token t) => t.containsChar(delta.end));
      final int endIndex =
          staleTokens.indexWhere((Token t) => t.containsChar(delta.start));
      for (int i = 0; i < staleTokens.length; i++) {
        final Token t = staleTokens[i];
        if (delta.start <= t.end) {
          if (delta.end <= t.end) {
            // INCOMPLETE: replace the part of the lexeme to be deleted
            newTokens.add(t.lexeme);
            newTokens
                .addAll([for (Token nt in staleTokens.sublist(i)) nt.lexeme]);
          } else {
            // ends in a different token
          }
          break;
        }
        newTokens.add(t.lexeme);
      }
      return newTokens.join();
    } else {
      //
    }
  } */
}

extension TokenListUtils on List<Token> {
  String flatten() => [for (Token t in this) t.lexeme].join();
}
