class Store {
  final String name;
  final String address;
  final String remainStat;
  final DateTime stockAt;

  const Store({
    required this.name,
    required this.address,
    required this.remainStat,
    required this.stockAt,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Store &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          address == other.address &&
          remainStat == other.remainStat &&
          stockAt == other.stockAt;

  @override
  int get hashCode =>
      name.hashCode ^ address.hashCode ^ remainStat.hashCode ^ stockAt.hashCode;

  @override
  String toString() {
    return 'Store{name: $name, address: $address, remainStat: $remainStat, stockAt: $stockAt}';
  }
}
