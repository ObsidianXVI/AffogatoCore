part of affogato_core;

/// Matches a [Token] to a specific styling of type [T]. The styling properties are defined
/// by subclasses that extend this base class.
abstract class RenderToken<T> {
  final ASTNode node;

  const RenderToken(this.node);

  T render();
}
