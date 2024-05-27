part of affogato_core;

typedef Char = String;

class TokenType {
  final String lexeme;

  const TokenType(this.lexeme);

  const TokenType.eof() : lexeme = '<EOF>';
}

class Cursor {
  final String source;
  final List<List<Char>> charMap;
  int col = 0;
  int row = 0;

  Cursor(this.source)
      : charMap = source.split('\n').map((e) => e.split('')).toList();

  Char get current => charMap[row][col];

  T _nextCharOrElse<T>({
    required T Function(String) withNextChar,
    required T Function() orElse,
    bool updateState = false,
  }) {
    int newRow = row;
    int newCol = col;
    if (newCol + 1 >= charMap[newRow].length) {
      if (newRow + 1 >= charMap.length) {
        return orElse();
      } else {
        newRow += 1;
      }
    } else {
      newCol += 1;
    }
    if (updateState) {
      row = newRow;
      col = newCol;
    }
    return withNextChar(charMap[newRow][newCol]);
  }

  List<Char> peek([int lookAhead = 1]) {
    final List<Char> res = [];
    int newRow = row;
    int newCol = col;
    int remainingLookAheads = lookAhead;
    while (remainingLookAheads != 0) {
      if (newCol + 1 >= charMap[newRow].length) {
        if (newRow + 1 >= charMap.length) {
          res.add(TokenType.eof().lexeme);
          return res;
        } else {
          newRow += 1;
          newCol = 0;
        }
      } else {
        newCol += 1;
      }
      res.add(charMap[newRow][newCol]);
      remainingLookAheads -= 1;
    }
    return res;
  }

  Char advance() => _nextCharOrElse(
        withNextChar: (Char c) => c,
        orElse: () => TokenType.eof().lexeme,
        updateState: true,
      );

  bool nextMatches(Char target) => _nextCharOrElse(
        withNextChar: (Char c) => c == target,
        orElse: () => false,
      );

  bool nextMatchesAny(List<Char> targets) => _nextCharOrElse(
        withNextChar: (Char c) => targets.contains(c),
        orElse: () => false,
      );
}
