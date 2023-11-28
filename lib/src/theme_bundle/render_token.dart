part of affogato_core;

/// Matches a [Token] to a specific styling. The styling properties are defined
/// by subclasses that extend this base class.
abstract class RenderToken<T> {
  final Token token;

  const RenderToken(this.token);

  T render();
}
