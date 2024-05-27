library affogato_core;

import 'dart:ffi';

part './document.dart';

part './language_bundle/language_bundle.dart';
part './language_bundle/tokeniser/tokeniser.dart';
part './language_bundle/tokeniser/token.dart';
part './language_bundle/tokeniser/cursor.dart';
part './language_bundle/parser/parser.dart';
part './language_bundle/parser/ast.dart';
part './language_bundle/interpreter/interpreter.dart';

part './theme_bundle/theme_bundle.dart';
part './theme_bundle/syntax_highlighter.dart';
part './theme_bundle/render_token.dart';

part './delta_handler/delta_handler.dart';
part './delta_handler/delta.dart';

part './language_definition/native_bnf.dart';

part './utils/utils.dart';

void main(List<String> args) {
  final c = Cursor("ala\nb\nama");
  print(c.peek());
  print(c.peek(2));
  print(c.advance());
  print(c.peek());
}
