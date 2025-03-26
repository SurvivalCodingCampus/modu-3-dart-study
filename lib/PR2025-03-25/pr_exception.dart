class ErrorCatch implements Exception {
  final int zero;

  ErrorCatch(this.zero);

  @override
  String toString() {
    return '$zero';
  }
}
