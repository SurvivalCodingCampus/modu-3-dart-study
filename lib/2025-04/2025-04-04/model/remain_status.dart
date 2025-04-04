enum RemainStatus {
  plenty,
  some,
  few,
  empty;

  static RemainStatus? fromName(String name) {
    try {
      return RemainStatus.values.firstWhere((status) => status.name == name);
    } catch (_) {
      return null;
    }
  }

  String toJson() {
    return name;
  }
}
