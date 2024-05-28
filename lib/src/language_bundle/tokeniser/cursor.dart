part of affogato_core;

typedef Char = String;

const String eofStr = '<EOF>';

class TokenType {
  final String lexeme;

  const TokenType(this.lexeme);

  const TokenType.eof() : lexeme = eofStr;
}

class Cursor {
  final String source;
  final List<List<Char>> charMap;
  int col = 0;
  int row = 0;

  Cursor(this.source)
      : charMap = source.split('\n').map((e) => e.split('')).toList();

  CursorLocation location([CursorLocation? offset]) => CursorLocation(
        rowNum: (offset?.rowNum ?? 0) + row,
        colNum: (offset?.colNum ?? 0) + col,
      );

  Char get current => reachedEOF ? TokenType.eof().lexeme : charMap[row][col];
  bool get reachedEOF {
    return row + 1 == charMap.length && col + 1 > charMap[row].length;
  }

  T _nextCharOrElse<T>({
    required T Function(String) withNextChar,
    required T Function() orElse,
    bool updateState = false,
  }) {
    int newRow = row;
    int newCol = col;
    final Char curr = current;

    // Cannot advance row
    if (row == charMap.length && col == charMap[row - 1].length) {
      return orElse();
    }
    // Cannot advance col in current row
    if (col == charMap[row].length) {
      newRow += 1;
      newCol = 0;
    } else {
      newCol += 1;
    }

    if (updateState) {
      row = newRow;
      col = newCol;
    }
    return withNextChar(curr);
  }

  List<Char> peek([int lookAhead = 1]) {
    final List<Char> res = [];
    int newRow = row;
    int newCol = col;
    Char curr = current;

    int remainingLookAheads = lookAhead;
    while (remainingLookAheads != 0) {
      // Cannot advance row
      if (newRow == charMap.length && newCol == charMap[newRow - 1].length) {
        res.add(TokenType.eof().lexeme);
        return res;
      }
      // Cannot advance col in current row
      if (newCol == charMap[newRow].length) {
        newRow += 1;
        newCol = 0;
      } else {
        newCol += 1;
      }

      res.add(curr);
      curr = charMap[newRow][newCol];
      remainingLookAheads -= 1;
    }
    return res;
  }

  Char advance() => _nextCharOrElse(
        withNextChar: (Char c) => c,
        orElse: () => TokenType.eof().lexeme,
        updateState: true,
      );

  void skip() => _nextCharOrElse(
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
